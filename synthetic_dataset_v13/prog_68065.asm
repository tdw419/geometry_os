; DESCRIPTION: Renders a black disk with center (61, 117) and radius 58.
; PLAN: r0=61(x), r1=117(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 117
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
