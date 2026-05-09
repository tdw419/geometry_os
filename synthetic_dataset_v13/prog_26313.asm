; DESCRIPTION: Renders a white disk with center (270, 147) and radius 61.
; PLAN: r0=270(x), r1=147(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 147
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
