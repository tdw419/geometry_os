; DESCRIPTION: Creates a purple circular shape at (432, 77) with radius 21.
; PLAN: r0=432(x), r1=77(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 77
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
