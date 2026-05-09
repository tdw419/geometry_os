; DESCRIPTION: Renders a black disk with center (99, 78) and radius 58.
; PLAN: r0=99(x), r1=78(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 78
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
