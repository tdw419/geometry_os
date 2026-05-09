; DESCRIPTION: Renders a black disk with center (244, 74) and radius 29.
; PLAN: r0=244(x), r1=74(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 74
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
