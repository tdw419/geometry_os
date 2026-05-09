; DESCRIPTION: Renders a black disk with center (26, 128) and radius 15.
; PLAN: r0=26(x), r1=128(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 128
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
