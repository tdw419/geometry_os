; DESCRIPTION: Renders a black disk with center (472, 198) and radius 12.
; PLAN: r0=472(x), r1=198(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 198
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
