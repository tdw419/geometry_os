; DESCRIPTION: Draws a magenta circle centered at (412, 101) with radius 69.
; PLAN: r0=412(x), r1=101(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 101
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
