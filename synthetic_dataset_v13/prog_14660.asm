; DESCRIPTION: Renders a purple disk with center (265, 159) and radius 51.
; PLAN: r0=265(x), r1=159(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 159
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
