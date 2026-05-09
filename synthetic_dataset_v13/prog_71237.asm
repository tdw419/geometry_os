; DESCRIPTION: Creates a white circular shape at (283, 88) with radius 41.
; PLAN: r0=283(x), r1=88(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 88
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
