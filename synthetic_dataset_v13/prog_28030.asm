; DESCRIPTION: Renders a black disk with center (161, 28) and radius 26.
; PLAN: r0=161(x), r1=28(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 28
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
