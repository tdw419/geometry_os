; DESCRIPTION: Creates a purple circular shape at (134, 141) with radius 74.
; PLAN: r0=134(x), r1=141(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 141
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
