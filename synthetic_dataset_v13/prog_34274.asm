; DESCRIPTION: Renders a yellow disk with center (136, 195) and radius 37.
; PLAN: r0=136(x), r1=195(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 195
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
