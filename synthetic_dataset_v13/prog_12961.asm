; DESCRIPTION: Creates a black circular shape at (377, 181) with radius 49.
; PLAN: r0=377(x), r1=181(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 181
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
