; DESCRIPTION: Renders a yellow disk with center (321, 71) and radius 13.
; PLAN: r0=321(x), r1=71(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 71
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
