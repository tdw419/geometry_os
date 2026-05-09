; DESCRIPTION: Renders a yellow disk with center (189, 181) and radius 46.
; PLAN: r0=189(x), r1=181(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 181
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
