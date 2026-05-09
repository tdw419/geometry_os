; DESCRIPTION: Creates a black circular shape at (227, 107) with radius 41.
; PLAN: r0=227(x), r1=107(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 107
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
