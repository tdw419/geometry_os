; DESCRIPTION: Renders a yellow disk with center (427, 75) and radius 24.
; PLAN: r0=427(x), r1=75(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 75
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
