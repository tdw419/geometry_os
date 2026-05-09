; DESCRIPTION: Creates a purple circular shape at (124, 180) with radius 31.
; PLAN: r0=124(x), r1=180(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 180
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
