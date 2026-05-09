; DESCRIPTION: Renders a yellow disk with center (95, 174) and radius 17.
; PLAN: r0=95(x), r1=174(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 174
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
