; DESCRIPTION: Renders a yellow disk with center (105, 122) and radius 58.
; PLAN: r0=105(x), r1=122(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 122
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
