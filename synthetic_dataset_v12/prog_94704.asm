; DESCRIPTION: Creates a orange circular shape at (283, 75) with radius 61.
; PLAN: r0=283(x), r1=75(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 75
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
