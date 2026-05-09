; DESCRIPTION: Creates a black circular shape at (115, 152) with radius 41.
; PLAN: r0=115(x), r1=152(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 152
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
