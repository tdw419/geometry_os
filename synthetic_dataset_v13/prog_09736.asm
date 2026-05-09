; DESCRIPTION: Draws a blue circle centered at (177, 148) with radius 69.
; PLAN: r0=177(x), r1=148(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 148
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
