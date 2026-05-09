; DESCRIPTION: Renders a black disk with center (336, 75) and radius 11.
; PLAN: r0=336(x), r1=75(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 75
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
