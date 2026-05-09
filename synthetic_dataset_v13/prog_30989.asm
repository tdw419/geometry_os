; DESCRIPTION: Renders a black disk with center (97, 163) and radius 11.
; PLAN: r0=97(x), r1=163(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 163
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
