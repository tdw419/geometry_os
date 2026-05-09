; DESCRIPTION: Renders a black disk with center (381, 100) and radius 26.
; PLAN: r0=381(x), r1=100(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 100
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
