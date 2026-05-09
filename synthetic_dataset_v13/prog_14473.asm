; DESCRIPTION: Renders a black disk with center (461, 69) and radius 43.
; PLAN: r0=461(x), r1=69(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 69
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
