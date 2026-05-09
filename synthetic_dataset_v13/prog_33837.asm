; DESCRIPTION: Creates a purple circular shape at (177, 82) with radius 41.
; PLAN: r0=177(x), r1=82(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 82
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
