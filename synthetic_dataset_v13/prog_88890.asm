; DESCRIPTION: Renders a yellow disk with center (377, 107) and radius 71.
; PLAN: r0=377(x), r1=107(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 107
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
