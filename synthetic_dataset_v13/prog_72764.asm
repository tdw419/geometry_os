; DESCRIPTION: Draws a black circle centered at (201, 136) with radius 69.
; PLAN: r0=201(x), r1=136(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 136
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
