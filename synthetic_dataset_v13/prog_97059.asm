; DESCRIPTION: Renders a black disk with center (148, 119) and radius 11.
; PLAN: r0=148(x), r1=119(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 119
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
