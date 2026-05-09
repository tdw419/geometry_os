; DESCRIPTION: Creates a black circular shape at (41, 82) with radius 17.
; PLAN: r0=41(x), r1=82(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 82
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
