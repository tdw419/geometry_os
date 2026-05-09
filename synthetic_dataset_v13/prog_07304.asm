; DESCRIPTION: Renders a yellow disk with center (110, 24) and radius 21.
; PLAN: r0=110(x), r1=24(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 24
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
