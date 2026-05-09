; DESCRIPTION: Renders a black disk with center (58, 57) and radius 11.
; PLAN: r0=58(x), r1=57(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 57
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
