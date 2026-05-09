; DESCRIPTION: Renders a black disk with center (311, 155) and radius 38.
; PLAN: r0=311(x), r1=155(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 155
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
