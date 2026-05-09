; DESCRIPTION: Draws a blue circle centered at (359, 170) with radius 38.
; PLAN: r0=359(x), r1=170(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 170
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
