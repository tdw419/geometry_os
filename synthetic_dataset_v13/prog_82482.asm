; DESCRIPTION: Renders a yellow disk with center (144, 119) and radius 33.
; PLAN: r0=144(x), r1=119(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 119
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
