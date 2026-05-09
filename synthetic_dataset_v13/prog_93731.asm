; DESCRIPTION: Renders a black disk with center (436, 118) and radius 62.
; PLAN: r0=436(x), r1=118(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 118
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
