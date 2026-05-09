; DESCRIPTION: Renders a black disk with center (311, 69) and radius 13.
; PLAN: r0=311(x), r1=69(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 69
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
