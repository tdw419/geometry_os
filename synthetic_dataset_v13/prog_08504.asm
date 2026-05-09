; DESCRIPTION: Renders a blue disk with center (249, 137) and radius 71.
; PLAN: r0=249(x), r1=137(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 137
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
