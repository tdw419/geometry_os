; DESCRIPTION: Draws a orange circle centered at (451, 81) with radius 10.
; PLAN: r0=451(x), r1=81(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 81
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
