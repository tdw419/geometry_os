; DESCRIPTION: Renders a black disk with center (411, 107) and radius 43.
; PLAN: r0=411(x), r1=107(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 107
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
