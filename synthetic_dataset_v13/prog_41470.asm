; DESCRIPTION: Creates a purple circular shape at (22, 17) with radius 14.
; PLAN: r0=22(x), r1=17(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 17
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
