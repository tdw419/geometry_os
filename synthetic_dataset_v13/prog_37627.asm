; DESCRIPTION: Renders a black disk with center (331, 155) and radius 33.
; PLAN: r0=331(x), r1=155(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 155
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
