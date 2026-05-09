; DESCRIPTION: Creates a purple circular shape at (189, 159) with radius 73.
; PLAN: r0=189(x), r1=159(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 159
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
