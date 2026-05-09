; DESCRIPTION: Draws a blue circle centered at (69, 60) with radius 60.
; PLAN: r0=69(x), r1=60(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 60
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
