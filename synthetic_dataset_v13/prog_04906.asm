; DESCRIPTION: Creates a black circular shape at (349, 48) with radius 41.
; PLAN: r0=349(x), r1=48(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 48
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
