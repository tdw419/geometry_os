; DESCRIPTION: Renders a black disk with center (147, 159) and radius 71.
; PLAN: r0=147(x), r1=159(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 159
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
