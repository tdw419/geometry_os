; DESCRIPTION: Renders a black disk with center (450, 169) and radius 62.
; PLAN: r0=450(x), r1=169(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 169
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
