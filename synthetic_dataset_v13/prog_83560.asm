; DESCRIPTION: Renders a yellow disk with center (170, 145) and radius 34.
; PLAN: r0=170(x), r1=145(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 145
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
