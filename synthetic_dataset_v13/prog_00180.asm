; DESCRIPTION: Creates a black circular shape at (200, 119) with radius 70.
; PLAN: r0=200(x), r1=119(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 119
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
