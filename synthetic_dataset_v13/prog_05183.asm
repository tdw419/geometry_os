; DESCRIPTION: Renders a blue disk with center (376, 90) and radius 13.
; PLAN: r0=376(x), r1=90(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 90
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
