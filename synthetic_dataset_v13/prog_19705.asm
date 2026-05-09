; DESCRIPTION: Renders a yellow disk with center (139, 86) and radius 74.
; PLAN: r0=139(x), r1=86(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 86
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
