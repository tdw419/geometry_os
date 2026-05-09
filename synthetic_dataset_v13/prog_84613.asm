; DESCRIPTION: Renders a black disk with center (382, 153) and radius 53.
; PLAN: r0=382(x), r1=153(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 153
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
