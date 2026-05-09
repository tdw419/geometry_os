; DESCRIPTION: Renders a black disk with center (339, 85) and radius 75.
; PLAN: r0=339(x), r1=85(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 85
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
