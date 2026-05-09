; DESCRIPTION: Renders a blue disk with center (249, 194) and radius 49.
; PLAN: r0=249(x), r1=194(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 194
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
