; DESCRIPTION: Renders a blue disk with center (73, 119) and radius 33.
; PLAN: r0=73(x), r1=119(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 119
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
