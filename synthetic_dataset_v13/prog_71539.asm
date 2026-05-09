; DESCRIPTION: Renders a yellow disk with center (357, 75) and radius 48.
; PLAN: r0=357(x), r1=75(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 75
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
