; DESCRIPTION: Renders a black disk with center (249, 119) and radius 64.
; PLAN: r0=249(x), r1=119(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 119
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
