; DESCRIPTION: Creates a purple circular shape at (342, 167) with radius 41.
; PLAN: r0=342(x), r1=167(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 167
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
