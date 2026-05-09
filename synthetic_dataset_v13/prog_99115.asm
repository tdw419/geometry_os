; DESCRIPTION: Renders a yellow disk with center (101, 85) and radius 65.
; PLAN: r0=101(x), r1=85(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 85
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
