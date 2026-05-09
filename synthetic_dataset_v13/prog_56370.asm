; DESCRIPTION: Creates a purple circular shape at (321, 62) with radius 30.
; PLAN: r0=321(x), r1=62(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 62
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
