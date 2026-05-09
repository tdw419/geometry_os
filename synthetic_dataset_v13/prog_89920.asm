; DESCRIPTION: Creates a purple circular shape at (97, 93) with radius 76.
; PLAN: r0=97(x), r1=93(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 93
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
