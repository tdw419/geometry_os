; DESCRIPTION: Renders a black disk with center (142, 39) and radius 14.
; PLAN: r0=142(x), r1=39(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 39
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
