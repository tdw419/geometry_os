; DESCRIPTION: Renders a black disk with center (123, 174) and radius 80.
; PLAN: r0=123(x), r1=174(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 174
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
