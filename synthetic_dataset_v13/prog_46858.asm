; DESCRIPTION: Creates a purple circular shape at (321, 202) with radius 49.
; PLAN: r0=321(x), r1=202(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 202
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
