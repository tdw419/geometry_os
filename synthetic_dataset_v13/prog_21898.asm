; DESCRIPTION: Renders a purple disk with center (352, 157) and radius 75.
; PLAN: r0=352(x), r1=157(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 157
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
