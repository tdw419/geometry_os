; DESCRIPTION: Renders a yellow disk with center (321, 90) and radius 74.
; PLAN: r0=321(x), r1=90(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 90
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
