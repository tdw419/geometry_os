; DESCRIPTION: Renders a yellow disk with center (309, 147) and radius 55.
; PLAN: r0=309(x), r1=147(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 147
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
