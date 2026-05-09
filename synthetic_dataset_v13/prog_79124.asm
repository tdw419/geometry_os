; DESCRIPTION: Renders a black disk with center (123, 119) and radius 66.
; PLAN: r0=123(x), r1=119(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 119
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
