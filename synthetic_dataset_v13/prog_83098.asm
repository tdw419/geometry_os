; DESCRIPTION: Renders a black disk with center (115, 107) and radius 23.
; PLAN: r0=115(x), r1=107(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 107
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
