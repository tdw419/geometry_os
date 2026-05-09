; DESCRIPTION: Renders a black disk with center (114, 162) and radius 52.
; PLAN: r0=114(x), r1=162(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 162
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
