; DESCRIPTION: Renders a black disk with center (355, 37) and radius 18.
; PLAN: r0=355(x), r1=37(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 37
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
