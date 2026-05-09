; DESCRIPTION: Draws a blue circle centered at (139, 22) with radius 17.
; PLAN: r0=139(x), r1=22(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 22
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
