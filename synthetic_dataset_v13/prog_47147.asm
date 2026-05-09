; DESCRIPTION: Renders a yellow disk with center (179, 119) and radius 62.
; PLAN: r0=179(x), r1=119(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 119
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
