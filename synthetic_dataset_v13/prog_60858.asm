; DESCRIPTION: Renders a black disk with center (371, 122) and radius 15.
; PLAN: r0=371(x), r1=122(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 122
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
