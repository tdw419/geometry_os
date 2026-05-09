; DESCRIPTION: Renders a black disk with center (424, 142) and radius 60.
; PLAN: r0=424(x), r1=142(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 142
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
