; DESCRIPTION: Renders a yellow disk with center (59, 94) and radius 58.
; PLAN: r0=59(x), r1=94(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 94
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
