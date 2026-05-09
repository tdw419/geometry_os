; DESCRIPTION: Renders a black disk with center (265, 102) and radius 66.
; PLAN: r0=265(x), r1=102(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 102
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
