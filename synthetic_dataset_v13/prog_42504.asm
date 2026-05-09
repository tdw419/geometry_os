; DESCRIPTION: Creates a purple circular shape at (319, 179) with radius 71.
; PLAN: r0=319(x), r1=179(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 179
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
