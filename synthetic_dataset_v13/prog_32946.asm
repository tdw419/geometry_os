; DESCRIPTION: Renders a yellow disk with center (233, 188) and radius 54.
; PLAN: r0=233(x), r1=188(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 188
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
