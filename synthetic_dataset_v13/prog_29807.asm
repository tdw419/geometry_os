; DESCRIPTION: Renders a yellow disk with center (432, 81) and radius 21.
; PLAN: r0=432(x), r1=81(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 81
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
