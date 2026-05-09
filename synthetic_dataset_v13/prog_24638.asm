; DESCRIPTION: Creates a blue circular shape at (323, 105) with radius 53.
; PLAN: r0=323(x), r1=105(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 105
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
