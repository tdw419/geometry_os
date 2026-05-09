; DESCRIPTION: Renders a yellow disk with center (416, 100) and radius 51.
; PLAN: r0=416(x), r1=100(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 100
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
