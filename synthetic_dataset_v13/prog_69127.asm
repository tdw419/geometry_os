; DESCRIPTION: Renders a black disk with center (164, 89) and radius 49.
; PLAN: r0=164(x), r1=89(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 89
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
