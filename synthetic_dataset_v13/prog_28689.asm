; DESCRIPTION: Renders a black disk with center (388, 138) and radius 58.
; PLAN: r0=388(x), r1=138(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 138
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
