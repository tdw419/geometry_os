; DESCRIPTION: Creates a orange circular shape at (451, 101) with radius 30.
; PLAN: r0=451(x), r1=101(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 101
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
