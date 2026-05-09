; DESCRIPTION: Renders a yellow disk with center (114, 171) and radius 34.
; PLAN: r0=114(x), r1=171(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 171
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
