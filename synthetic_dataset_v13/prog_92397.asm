; DESCRIPTION: Renders a yellow disk with center (381, 102) and radius 58.
; PLAN: r0=381(x), r1=102(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 102
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
