; DESCRIPTION: Renders a black disk with center (475, 155) and radius 28.
; PLAN: r0=475(x), r1=155(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 155
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
