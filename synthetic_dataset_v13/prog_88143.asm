; DESCRIPTION: Creates a black circular shape at (177, 191) with radius 41.
; PLAN: r0=177(x), r1=191(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 191
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
