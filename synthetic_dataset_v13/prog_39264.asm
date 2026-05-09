; DESCRIPTION: Renders a blue disk with center (376, 80) and radius 22.
; PLAN: r0=376(x), r1=80(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 80
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
