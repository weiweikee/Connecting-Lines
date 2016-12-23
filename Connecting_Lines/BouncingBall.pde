// Connecting Lines 
// by Wei Wei Chi (Oct 3th 2016) 

class BouncingBall { // Creating a template for Bouncing ball (Setting Class)

  float x; // declare x
  float y; // declare y
  float d; // declare d
  float xspeed = 1.5; // Speed of x movement
  float yspeed = 1.5; // Speed of y movement
  float xdirection = 0.0; // Movement direction on x axis
  float ydirection = 0.0; // Movement direction on y axis
  int id;
  BouncingBall[] others;


  BouncingBall(float tempX, float tempY, float tempD, int tempId, BouncingBall [] tempB) {
    x = tempX; // Substituting tempX with real x value
    y = tempY; // Substituting tempY with real y value
    d = tempD; // Substituting tempD with real d value
    id = tempId;
    others = tempB;
    // keep trying a new random number until we get somethign that is not == 0
    while (xdirection == 0) {
      xdirection = random(-1, 1);
    }
    while (ydirection == 0) {
      ydirection = random(-1, 1);
    }
  }

  void connect() { // connecting lines
    for (int i = id+1; i < numBalls; i++) {
      // distance between two circles from center
      float distance = dist(x, y, others[i].x, others[i].y); 
      // maximum distance between circles
      float maxDist = others[i].d*10 + d*10; 
      // if the distance is smaller than maxDist form a line
      if (distance < maxDist) {  
        stroke(255);
        // mapping the distance with strokeWeight
        float sw = map(distance, 0, 40, 0, 3);
        strokeWeight(3 - sw);
        line(x, y, others[i].x, others[i].y);
        // checking the maximum sw 
        println(sw);
      }
    }
  }

  void move() { // setting up motion
    x = x + (xspeed * xdirection);
    y = y + (yspeed * ydirection);
    if (x > width-d || x < d) { // Making sure x coordinate fit in the box
      xdirection *= -1; // Changing x direction
    }
    if (y > height-d || y < d) { // Making sure y coordinate fit in the box
      ydirection *= -1; // Changing y direction
    }
  }

  void display() { // setting up circle for display
    noStroke();
    fill(255);
    ellipse(x, y, d, d);
  }
}