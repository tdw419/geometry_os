; DESCRIPTION: Draws a black circle centered at (379, 83) with radius 41.
; PLAN: r0=379(x), r1=83(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 83
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
