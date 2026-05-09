; DESCRIPTION: Renders a blue disk with center (49, 86) and radius 23.
; PLAN: r0=49(x), r1=86(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 86
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
