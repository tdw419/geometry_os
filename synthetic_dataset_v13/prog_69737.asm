; DESCRIPTION: Creates a purple circular shape at (195, 58) with radius 34.
; PLAN: r0=195(x), r1=58(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 58
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
