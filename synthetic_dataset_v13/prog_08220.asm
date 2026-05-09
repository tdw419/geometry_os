; DESCRIPTION: Creates a black circular shape at (452, 89) with radius 41.
; PLAN: r0=452(x), r1=89(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 89
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
