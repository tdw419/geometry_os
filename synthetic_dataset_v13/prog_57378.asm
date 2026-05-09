; DESCRIPTION: Renders a black disk with center (34, 18) and radius 18.
; PLAN: r0=34(x), r1=18(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 18
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
