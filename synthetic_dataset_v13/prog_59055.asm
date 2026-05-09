; DESCRIPTION: Renders a white disk with center (250, 147) and radius 28.
; PLAN: r0=250(x), r1=147(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 147
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
