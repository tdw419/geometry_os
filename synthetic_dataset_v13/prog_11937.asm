; DESCRIPTION: Renders a purple disk with center (399, 179) and radius 57.
; PLAN: r0=399(x), r1=179(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 179
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
