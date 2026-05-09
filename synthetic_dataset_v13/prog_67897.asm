; DESCRIPTION: Renders a yellow disk with center (476, 114) and radius 26.
; PLAN: r0=476(x), r1=114(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 114
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
