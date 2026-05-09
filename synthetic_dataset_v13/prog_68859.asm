; DESCRIPTION: Renders a purple disk with center (114, 178) and radius 77.
; PLAN: r0=114(x), r1=178(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 178
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
