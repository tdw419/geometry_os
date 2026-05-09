; DESCRIPTION: Renders a purple disk with center (338, 179) and radius 77.
; PLAN: r0=338(x), r1=179(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 179
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
