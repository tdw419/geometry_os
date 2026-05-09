; DESCRIPTION: Renders a purple disk with center (462, 147) and radius 46.
; PLAN: r0=462(x), r1=147(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 147
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
