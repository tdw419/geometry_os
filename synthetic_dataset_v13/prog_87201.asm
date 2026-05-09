; DESCRIPTION: Renders a yellow disk with center (472, 153) and radius 19.
; PLAN: r0=472(x), r1=153(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 472
LDI r1, 153
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
