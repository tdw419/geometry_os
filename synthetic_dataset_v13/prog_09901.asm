; DESCRIPTION: Renders a black disk with center (336, 29) and radius 18.
; PLAN: r0=336(x), r1=29(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 29
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
