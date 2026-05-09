; DESCRIPTION: Creates a blue circular shape at (119, 88) with radius 47.
; PLAN: r0=119(x), r1=88(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 88
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
