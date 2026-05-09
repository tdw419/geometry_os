; DESCRIPTION: Renders a yellow disk with center (449, 61) and radius 34.
; PLAN: r0=449(x), r1=61(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 61
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
