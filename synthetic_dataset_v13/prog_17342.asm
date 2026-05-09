; DESCRIPTION: Renders a yellow disk with center (111, 144) and radius 80.
; PLAN: r0=111(x), r1=144(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 144
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
