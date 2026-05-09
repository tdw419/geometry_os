; DESCRIPTION: Draws a green circle centered at (377, 110) with radius 69.
; PLAN: r0=377(x), r1=110(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 110
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
