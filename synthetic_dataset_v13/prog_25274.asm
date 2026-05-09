; DESCRIPTION: Renders a yellow disk with center (132, 89) and radius 79.
; PLAN: r0=132(x), r1=89(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 89
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
