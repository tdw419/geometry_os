; DESCRIPTION: Renders a purple disk with center (229, 182) and radius 12.
; PLAN: r0=229(x), r1=182(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 182
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
