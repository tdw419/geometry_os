; DESCRIPTION: Renders a yellow disk with center (396, 153) and radius 62.
; PLAN: r0=396(x), r1=153(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 153
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
