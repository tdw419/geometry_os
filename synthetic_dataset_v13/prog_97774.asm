; DESCRIPTION: Renders a blue disk with center (134, 89) and radius 23.
; PLAN: r0=134(x), r1=89(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 89
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
