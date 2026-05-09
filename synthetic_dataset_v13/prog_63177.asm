; DESCRIPTION: Renders a black disk with center (310, 172) and radius 69.
; PLAN: r0=310(x), r1=172(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 172
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
