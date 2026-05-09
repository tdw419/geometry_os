; DESCRIPTION: Renders a blue disk with center (240, 216) and radius 37.
; PLAN: r0=240(x), r1=216(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 216
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
