; DESCRIPTION: Draws a blue circle centered at (489, 193) with radius 15.
; PLAN: r0=489(x), r1=193(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 489
LDI r1, 193
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
