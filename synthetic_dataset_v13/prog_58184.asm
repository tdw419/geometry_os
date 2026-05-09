; DESCRIPTION: Renders a yellow disk with center (170, 74) and radius 58.
; PLAN: r0=170(x), r1=74(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 74
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
