; DESCRIPTION: Renders a purple disk with center (182, 101) and radius 71.
; PLAN: r0=182(x), r1=101(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 101
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
