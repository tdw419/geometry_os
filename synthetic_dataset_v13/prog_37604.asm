; DESCRIPTION: Renders a black disk with center (136, 45) and radius 40.
; PLAN: r0=136(x), r1=45(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 45
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
