; DESCRIPTION: Renders a yellow disk with center (311, 185) and radius 71.
; PLAN: r0=311(x), r1=185(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 185
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
