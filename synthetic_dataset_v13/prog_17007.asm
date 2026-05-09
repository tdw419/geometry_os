; DESCRIPTION: Draws a blue circle centered at (318, 192) with radius 30.
; PLAN: r0=318(x), r1=192(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 192
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
