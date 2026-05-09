; DESCRIPTION: Renders a yellow disk with center (177, 60) and radius 35.
; PLAN: r0=177(x), r1=60(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 60
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
