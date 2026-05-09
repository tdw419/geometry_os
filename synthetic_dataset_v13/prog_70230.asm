; DESCRIPTION: Renders a purple disk with center (156, 177) and radius 71.
; PLAN: r0=156(x), r1=177(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 177
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
