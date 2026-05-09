; DESCRIPTION: Renders a purple disk with center (339, 91) and radius 58.
; PLAN: r0=339(x), r1=91(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 91
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
