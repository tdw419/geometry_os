; DESCRIPTION: Creates a orange circular shape at (451, 87) with radius 55.
; PLAN: r0=451(x), r1=87(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 87
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
