; DESCRIPTION: Creates a purple circular shape at (153, 158) with radius 29.
; PLAN: r0=153(x), r1=158(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 158
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
