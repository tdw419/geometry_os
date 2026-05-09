; DESCRIPTION: Renders a yellow disk with center (114, 97) and radius 78.
; PLAN: r0=114(x), r1=97(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 97
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
