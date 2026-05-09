; DESCRIPTION: Renders a black disk with center (194, 185) and radius 45.
; PLAN: r0=194(x), r1=185(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 185
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
