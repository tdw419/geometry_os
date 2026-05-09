; DESCRIPTION: Renders a yellow disk with center (91, 84) and radius 59.
; PLAN: r0=91(x), r1=84(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 84
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
