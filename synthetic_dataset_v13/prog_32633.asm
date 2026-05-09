; DESCRIPTION: Renders a black disk with center (87, 183) and radius 23.
; PLAN: r0=87(x), r1=183(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 183
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
