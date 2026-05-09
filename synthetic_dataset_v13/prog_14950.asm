; DESCRIPTION: Renders a yellow disk with center (287, 170) and radius 29.
; PLAN: r0=287(x), r1=170(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 170
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
