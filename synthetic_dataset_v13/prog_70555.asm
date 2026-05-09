; DESCRIPTION: Renders a black disk with center (444, 88) and radius 68.
; PLAN: r0=444(x), r1=88(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 88
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
