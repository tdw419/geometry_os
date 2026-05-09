; DESCRIPTION: Renders a black disk with center (319, 181) and radius 71.
; PLAN: r0=319(x), r1=181(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 181
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
