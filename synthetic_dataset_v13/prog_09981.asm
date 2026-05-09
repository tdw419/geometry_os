; DESCRIPTION: Renders a black disk with center (343, 212) and radius 35.
; PLAN: r0=343(x), r1=212(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 212
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
