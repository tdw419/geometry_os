; DESCRIPTION: Renders a yellow disk with center (321, 113) and radius 72.
; PLAN: r0=321(x), r1=113(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 113
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
