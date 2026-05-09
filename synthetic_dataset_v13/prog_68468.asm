; DESCRIPTION: Renders a blue disk with center (368, 94) and radius 70.
; PLAN: r0=368(x), r1=94(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 94
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
