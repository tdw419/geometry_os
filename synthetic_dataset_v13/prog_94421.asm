; DESCRIPTION: Renders a purple disk with center (261, 182) and radius 30.
; PLAN: r0=261(x), r1=182(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 182
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
