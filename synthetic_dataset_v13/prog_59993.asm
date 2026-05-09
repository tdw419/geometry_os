; DESCRIPTION: Renders a black disk with center (244, 163) and radius 39.
; PLAN: r0=244(x), r1=163(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 163
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
