; DESCRIPTION: Renders a yellow disk with center (158, 115) and radius 11.
; PLAN: r0=158(x), r1=115(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 115
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
