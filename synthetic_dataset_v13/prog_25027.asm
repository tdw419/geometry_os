; DESCRIPTION: Renders a black disk with center (238, 135) and radius 39.
; PLAN: r0=238(x), r1=135(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 135
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
