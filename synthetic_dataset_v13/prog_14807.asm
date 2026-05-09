; DESCRIPTION: Renders a yellow disk with center (476, 199) and radius 35.
; PLAN: r0=476(x), r1=199(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 199
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
