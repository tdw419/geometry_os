; DESCRIPTION: Renders a black disk with center (364, 138) and radius 24.
; PLAN: r0=364(x), r1=138(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 138
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
