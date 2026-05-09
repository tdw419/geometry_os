; DESCRIPTION: Renders a yellow disk with center (116, 136) and radius 76.
; PLAN: r0=116(x), r1=136(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 136
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
