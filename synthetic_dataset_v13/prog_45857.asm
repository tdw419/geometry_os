; DESCRIPTION: Renders a yellow disk with center (100, 22) and radius 17.
; PLAN: r0=100(x), r1=22(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 22
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
