; DESCRIPTION: Renders a black disk with center (325, 79) and radius 28.
; PLAN: r0=325(x), r1=79(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 79
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
