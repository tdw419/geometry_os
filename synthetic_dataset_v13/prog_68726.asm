; DESCRIPTION: Renders a blue disk with center (277, 119) and radius 38.
; PLAN: r0=277(x), r1=119(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 119
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
