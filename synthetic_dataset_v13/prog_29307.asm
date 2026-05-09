; DESCRIPTION: Renders a black disk with center (137, 30) and radius 15.
; PLAN: r0=137(x), r1=30(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 30
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
