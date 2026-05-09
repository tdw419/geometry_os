; DESCRIPTION: Renders a red disk with center (476, 192) and radius 25.
; PLAN: r0=476(x), r1=192(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 192
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
