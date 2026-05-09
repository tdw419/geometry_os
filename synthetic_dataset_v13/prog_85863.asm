; DESCRIPTION: Renders a yellow disk with center (253, 91) and radius 79.
; PLAN: r0=253(x), r1=91(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 91
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
