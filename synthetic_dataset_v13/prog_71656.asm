; DESCRIPTION: Renders a yellow disk with center (323, 29) and radius 19.
; PLAN: r0=323(x), r1=29(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 29
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
