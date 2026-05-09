; DESCRIPTION: Creates a purple circular shape at (274, 124) with radius 80.
; PLAN: r0=274(x), r1=124(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 124
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
