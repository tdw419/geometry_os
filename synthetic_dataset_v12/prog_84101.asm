; DESCRIPTION: Renders a black disk with center (79, 174) and radius 69.
; PLAN: r0=79(x), r1=174(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 174
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
