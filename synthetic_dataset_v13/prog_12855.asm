; DESCRIPTION: Creates a orange circular shape at (283, 175) with radius 75.
; PLAN: r0=283(x), r1=175(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 175
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
