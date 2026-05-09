; DESCRIPTION: Creates a purple circular shape at (414, 161) with radius 77.
; PLAN: r0=414(x), r1=161(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 161
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
