; DESCRIPTION: Draws a purple circle centered at (304, 137) with radius 41.
; PLAN: r0=304(x), r1=137(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 137
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
