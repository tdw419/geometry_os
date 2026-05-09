; DESCRIPTION: Creates a purple circular shape at (177, 158) with radius 77.
; PLAN: r0=177(x), r1=158(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 158
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
