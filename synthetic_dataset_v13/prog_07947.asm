; DESCRIPTION: Renders a purple disk with center (123, 107) and radius 66.
; PLAN: r0=123(x), r1=107(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 107
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
