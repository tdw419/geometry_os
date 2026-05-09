; DESCRIPTION: Renders a purple disk with center (368, 140) and radius 28.
; PLAN: r0=368(x), r1=140(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 140
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
