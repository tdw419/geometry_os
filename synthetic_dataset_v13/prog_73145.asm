; DESCRIPTION: Renders a black disk with center (100, 147) and radius 77.
; PLAN: r0=100(x), r1=147(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 147
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
