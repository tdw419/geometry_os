; DESCRIPTION: Renders a yellow disk with center (270, 117) and radius 76.
; PLAN: r0=270(x), r1=117(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 117
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
