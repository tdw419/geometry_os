; DESCRIPTION: Renders a black disk with center (45, 101) and radius 35.
; PLAN: r0=45(x), r1=101(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 101
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
