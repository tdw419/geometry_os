; DESCRIPTION: Creates a purple circular shape at (171, 88) with radius 37.
; PLAN: r0=171(x), r1=88(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 88
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
