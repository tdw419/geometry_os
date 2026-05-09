; DESCRIPTION: Renders a yellow disk with center (145, 83) and radius 49.
; PLAN: r0=145(x), r1=83(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 83
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
