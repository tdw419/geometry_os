; DESCRIPTION: Renders a yellow disk with center (101, 144) and radius 18.
; PLAN: r0=101(x), r1=144(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 144
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
