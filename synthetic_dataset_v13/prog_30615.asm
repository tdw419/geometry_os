; DESCRIPTION: Renders a yellow disk with center (163, 120) and radius 54.
; PLAN: r0=163(x), r1=120(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 120
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
