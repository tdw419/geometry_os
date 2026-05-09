; DESCRIPTION: Creates a blue circular shape at (377, 85) with radius 14.
; PLAN: r0=377(x), r1=85(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 85
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
