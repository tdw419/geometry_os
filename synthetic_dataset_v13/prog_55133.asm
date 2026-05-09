; DESCRIPTION: Creates a purple circular shape at (22, 158) with radius 17.
; PLAN: r0=22(x), r1=158(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 158
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
