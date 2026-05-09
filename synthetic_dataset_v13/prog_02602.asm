; DESCRIPTION: Renders a black disk with center (85, 110) and radius 58.
; PLAN: r0=85(x), r1=110(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 110
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
