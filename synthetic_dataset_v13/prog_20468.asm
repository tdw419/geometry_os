; DESCRIPTION: Renders a black disk with center (236, 53) and radius 52.
; PLAN: r0=236(x), r1=53(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 53
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
