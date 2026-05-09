; DESCRIPTION: Creates a blue circular shape at (88, 85) with radius 70.
; PLAN: r0=88(x), r1=85(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 85
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
