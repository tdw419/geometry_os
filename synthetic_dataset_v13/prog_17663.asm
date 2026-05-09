; DESCRIPTION: Renders a yellow disk with center (249, 159) and radius 59.
; PLAN: r0=249(x), r1=159(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 159
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
