; DESCRIPTION: Renders a black disk with center (66, 178) and radius 28.
; PLAN: r0=66(x), r1=178(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 178
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
