; DESCRIPTION: Renders a yellow disk with center (138, 114) and radius 46.
; PLAN: r0=138(x), r1=114(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 114
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
