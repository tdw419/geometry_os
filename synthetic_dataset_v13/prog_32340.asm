; DESCRIPTION: Renders a yellow disk with center (149, 171) and radius 44.
; PLAN: r0=149(x), r1=171(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 171
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
