; DESCRIPTION: Creates a black circular shape at (112, 62) with radius 41.
; PLAN: r0=112(x), r1=62(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 62
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
