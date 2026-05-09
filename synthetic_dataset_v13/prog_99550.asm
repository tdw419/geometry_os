; DESCRIPTION: Renders a yellow disk with center (194, 63) and radius 62.
; PLAN: r0=194(x), r1=63(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 63
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
