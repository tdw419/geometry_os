; DESCRIPTION: Renders a yellow disk with center (103, 119) and radius 63.
; PLAN: r0=103(x), r1=119(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 119
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
