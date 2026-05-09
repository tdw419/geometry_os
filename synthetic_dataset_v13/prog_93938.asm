; DESCRIPTION: Renders a black disk with center (427, 122) and radius 56.
; PLAN: r0=427(x), r1=122(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 122
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
