; DESCRIPTION: Renders a purple disk with center (47, 45) and radius 29.
; PLAN: r0=47(x), r1=45(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 45
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
