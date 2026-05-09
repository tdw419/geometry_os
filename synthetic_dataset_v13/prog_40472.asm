; DESCRIPTION: Renders a black disk with center (134, 91) and radius 69.
; PLAN: r0=134(x), r1=91(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 91
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
