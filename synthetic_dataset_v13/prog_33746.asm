; DESCRIPTION: Renders a yellow disk with center (83, 109) and radius 38.
; PLAN: r0=83(x), r1=109(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 109
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
