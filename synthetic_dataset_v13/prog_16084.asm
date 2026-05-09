; DESCRIPTION: Renders a black disk with center (318, 70) and radius 26.
; PLAN: r0=318(x), r1=70(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 70
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
