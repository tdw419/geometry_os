; DESCRIPTION: Renders a blue disk with center (402, 191) and radius 44.
; PLAN: r0=402(x), r1=191(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 191
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
