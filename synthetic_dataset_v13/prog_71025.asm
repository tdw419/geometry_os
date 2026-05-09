; DESCRIPTION: Renders a yellow disk with center (120, 84) and radius 10.
; PLAN: r0=120(x), r1=84(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 84
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
