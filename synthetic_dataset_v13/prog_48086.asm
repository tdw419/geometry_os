; DESCRIPTION: Renders a blue disk with center (319, 137) and radius 80.
; PLAN: r0=319(x), r1=137(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 137
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
