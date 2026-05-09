; DESCRIPTION: Renders a yellow disk with center (112, 133) and radius 26.
; PLAN: r0=112(x), r1=133(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 133
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
