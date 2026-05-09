; DESCRIPTION: Renders a yellow disk with center (322, 117) and radius 78.
; PLAN: r0=322(x), r1=117(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 117
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
