; DESCRIPTION: Renders a yellow disk with center (266, 101) and radius 22.
; PLAN: r0=266(x), r1=101(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 101
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
