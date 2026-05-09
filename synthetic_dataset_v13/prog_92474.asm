; DESCRIPTION: Creates a purple circular shape at (299, 110) with radius 77.
; PLAN: r0=299(x), r1=110(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 110
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
