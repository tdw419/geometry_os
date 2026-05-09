; DESCRIPTION: Renders a purple disk with center (217, 159) and radius 78.
; PLAN: r0=217(x), r1=159(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 159
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
