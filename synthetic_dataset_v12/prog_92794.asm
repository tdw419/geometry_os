; DESCRIPTION: Renders a black disk with center (423, 177) and radius 66.
; PLAN: r0=423(x), r1=177(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 177
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
