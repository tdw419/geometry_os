; DESCRIPTION: Draws a blue circle centered at (315, 110) with radius 24.
; PLAN: r0=315(x), r1=110(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 110
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
