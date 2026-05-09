; DESCRIPTION: Renders a blue disk with center (158, 189) and radius 10.
; PLAN: r0=158(x), r1=189(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 189
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
