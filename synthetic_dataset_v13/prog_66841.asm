; DESCRIPTION: Creates a purple circular shape at (124, 155) with radius 36.
; PLAN: r0=124(x), r1=155(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 155
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
