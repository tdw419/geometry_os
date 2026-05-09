; DESCRIPTION: Renders a blue disk with center (266, 158) and radius 70.
; PLAN: r0=266(x), r1=158(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 158
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
