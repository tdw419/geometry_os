; DESCRIPTION: Renders a black disk with center (311, 137) and radius 14.
; PLAN: r0=311(x), r1=137(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 137
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
