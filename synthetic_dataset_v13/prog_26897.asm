; DESCRIPTION: Renders a yellow disk with center (75, 174) and radius 11.
; PLAN: r0=75(x), r1=174(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 174
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
