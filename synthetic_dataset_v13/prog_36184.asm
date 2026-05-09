; DESCRIPTION: Renders a green disk with center (238, 142) and radius 76.
; PLAN: r0=238(x), r1=142(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 142
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
