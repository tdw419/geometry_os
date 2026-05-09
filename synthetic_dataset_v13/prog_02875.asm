; DESCRIPTION: Renders a black disk with center (59, 115) and radius 53.
; PLAN: r0=59(x), r1=115(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 115
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
