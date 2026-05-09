; DESCRIPTION: Renders a blue disk with center (247, 107) and radius 23.
; PLAN: r0=247(x), r1=107(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 107
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
