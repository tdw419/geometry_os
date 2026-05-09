; DESCRIPTION: Renders a blue disk with center (24, 78) and radius 10.
; PLAN: r0=24(x), r1=78(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 78
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
