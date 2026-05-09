; DESCRIPTION: Creates a orange circular shape at (348, 158) with radius 66.
; PLAN: r0=348(x), r1=158(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 158
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
