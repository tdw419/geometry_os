; DESCRIPTION: Renders a blue disk with center (469, 138) and radius 31.
; PLAN: r0=469(x), r1=138(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 138
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
