; DESCRIPTION: Renders a black disk with center (62, 158) and radius 61.
; PLAN: r0=62(x), r1=158(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 158
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
