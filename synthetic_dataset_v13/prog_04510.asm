; DESCRIPTION: Renders a red disk with center (314, 102) and radius 33.
; PLAN: r0=314(x), r1=102(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 102
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
