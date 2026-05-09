; DESCRIPTION: Renders a black disk with center (79, 140) and radius 15.
; PLAN: r0=79(x), r1=140(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 140
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
