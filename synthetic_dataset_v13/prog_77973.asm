; DESCRIPTION: Creates a purple circular shape at (315, 179) with radius 49.
; PLAN: r0=315(x), r1=179(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 179
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
