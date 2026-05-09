; DESCRIPTION: Creates a purple circular shape at (420, 118) with radius 77.
; PLAN: r0=420(x), r1=118(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 118
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
