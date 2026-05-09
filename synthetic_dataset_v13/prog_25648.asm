; DESCRIPTION: Renders a black disk with center (466, 118) and radius 36.
; PLAN: r0=466(x), r1=118(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 118
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
