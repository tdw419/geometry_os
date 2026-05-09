; DESCRIPTION: Renders a yellow disk with center (402, 137) and radius 65.
; PLAN: r0=402(x), r1=137(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 137
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
