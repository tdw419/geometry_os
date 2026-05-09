; DESCRIPTION: Renders a blue disk with center (330, 216) and radius 38.
; PLAN: r0=330(x), r1=216(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 216
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
