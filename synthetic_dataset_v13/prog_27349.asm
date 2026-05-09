; DESCRIPTION: Renders a black disk with center (236, 80) and radius 74.
; PLAN: r0=236(x), r1=80(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 80
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
