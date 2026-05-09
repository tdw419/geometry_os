; DESCRIPTION: Creates a purple circular shape at (134, 167) with radius 54.
; PLAN: r0=134(x), r1=167(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 167
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
