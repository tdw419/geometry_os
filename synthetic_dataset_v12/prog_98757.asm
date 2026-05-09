; DESCRIPTION: Renders a yellow disk with center (357, 165) and radius 21.
; PLAN: r0=357(x), r1=165(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 165
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
