; DESCRIPTION: Renders a yellow disk with center (103, 155) and radius 56.
; PLAN: r0=103(x), r1=155(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 155
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
