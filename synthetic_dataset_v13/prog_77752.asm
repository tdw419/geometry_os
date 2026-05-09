; DESCRIPTION: Renders a black disk with center (24, 181) and radius 23.
; PLAN: r0=24(x), r1=181(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 181
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
