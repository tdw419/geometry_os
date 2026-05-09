; DESCRIPTION: Renders a yellow disk with center (249, 78) and radius 72.
; PLAN: r0=249(x), r1=78(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 78
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
