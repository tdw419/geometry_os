; DESCRIPTION: Creates a green circular shape at (205, 167) with radius 41.
; PLAN: r0=205(x), r1=167(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 167
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
