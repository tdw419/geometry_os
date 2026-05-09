; DESCRIPTION: Renders a yellow disk with center (123, 179) and radius 62.
; PLAN: r0=123(x), r1=179(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 179
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
