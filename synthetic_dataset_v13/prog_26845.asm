; DESCRIPTION: Renders a yellow disk with center (373, 101) and radius 36.
; PLAN: r0=373(x), r1=101(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 101
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
