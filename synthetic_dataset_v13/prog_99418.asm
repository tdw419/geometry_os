; DESCRIPTION: Renders a black disk with center (439, 114) and radius 21.
; PLAN: r0=439(x), r1=114(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 114
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
