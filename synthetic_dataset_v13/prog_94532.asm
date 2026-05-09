; DESCRIPTION: Creates a purple circular shape at (417, 80) with radius 34.
; PLAN: r0=417(x), r1=80(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 80
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
