; DESCRIPTION: Renders a black disk with center (273, 167) and radius 48.
; PLAN: r0=273(x), r1=167(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 167
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
