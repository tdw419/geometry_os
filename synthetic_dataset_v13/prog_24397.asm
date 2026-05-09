; DESCRIPTION: Draws a magenta circle centered at (369, 76) with radius 69.
; PLAN: r0=369(x), r1=76(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 76
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
