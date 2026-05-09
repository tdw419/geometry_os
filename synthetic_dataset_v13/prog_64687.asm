; DESCRIPTION: Renders a yellow disk with center (273, 112) and radius 69.
; PLAN: r0=273(x), r1=112(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 112
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
