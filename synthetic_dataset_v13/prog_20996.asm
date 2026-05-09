; DESCRIPTION: Renders a yellow disk with center (130, 150) and radius 62.
; PLAN: r0=130(x), r1=150(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 150
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
