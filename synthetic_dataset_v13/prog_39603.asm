; DESCRIPTION: Renders a blue disk with center (89, 207) and radius 12.
; PLAN: r0=89(x), r1=207(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 207
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
