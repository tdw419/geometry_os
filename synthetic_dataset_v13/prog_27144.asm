; DESCRIPTION: Draws a blue circle centered at (38, 110) with radius 17.
; PLAN: r0=38(x), r1=110(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 110
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
