; DESCRIPTION: Creates a purple circular shape at (76, 115) with radius 49.
; PLAN: r0=76(x), r1=115(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 115
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
