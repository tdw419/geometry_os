; DESCRIPTION: Renders a yellow disk with center (423, 142) and radius 65.
; PLAN: r0=423(x), r1=142(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 142
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
