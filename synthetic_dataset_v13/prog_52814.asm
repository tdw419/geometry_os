; DESCRIPTION: Creates a orange circular shape at (451, 145) with radius 56.
; PLAN: r0=451(x), r1=145(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 145
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
