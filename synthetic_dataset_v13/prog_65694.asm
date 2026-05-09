; DESCRIPTION: Renders a purple disk with center (112, 166) and radius 75.
; PLAN: r0=112(x), r1=166(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 166
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
