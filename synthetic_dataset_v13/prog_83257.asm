; DESCRIPTION: Renders a yellow disk with center (423, 61) and radius 60.
; PLAN: r0=423(x), r1=61(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 61
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
