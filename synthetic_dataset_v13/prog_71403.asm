; DESCRIPTION: Renders a yellow disk with center (238, 119) and radius 64.
; PLAN: r0=238(x), r1=119(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 119
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
