; DESCRIPTION: Renders a purple disk with center (367, 60) and radius 36.
; PLAN: r0=367(x), r1=60(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 60
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
