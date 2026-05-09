; DESCRIPTION: Creates a purple circular shape at (471, 115) with radius 32.
; PLAN: r0=471(x), r1=115(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 115
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
