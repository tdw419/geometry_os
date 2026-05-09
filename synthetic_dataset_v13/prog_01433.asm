; DESCRIPTION: Renders a black disk with center (191, 135) and radius 26.
; PLAN: r0=191(x), r1=135(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 135
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
