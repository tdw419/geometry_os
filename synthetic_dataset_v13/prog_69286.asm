; DESCRIPTION: Renders a yellow disk with center (322, 189) and radius 67.
; PLAN: r0=322(x), r1=189(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 189
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
