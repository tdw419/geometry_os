; DESCRIPTION: Renders a black disk with center (122, 189) and radius 16.
; PLAN: r0=122(x), r1=189(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 189
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
