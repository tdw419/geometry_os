; DESCRIPTION: Creates a orange circular shape at (283, 94) with radius 71.
; PLAN: r0=283(x), r1=94(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 94
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
