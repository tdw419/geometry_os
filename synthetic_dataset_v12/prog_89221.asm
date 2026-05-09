; DESCRIPTION: Renders a purple disk with center (285, 159) and radius 65.
; PLAN: r0=285(x), r1=159(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 159
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
