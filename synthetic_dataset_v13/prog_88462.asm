; DESCRIPTION: Draws a orange circle centered at (451, 218) with radius 14.
; PLAN: r0=451(x), r1=218(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 218
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
