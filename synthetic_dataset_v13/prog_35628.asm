; DESCRIPTION: Renders a black disk with center (147, 80) and radius 20.
; PLAN: r0=147(x), r1=80(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 80
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
