; DESCRIPTION: Renders a purple disk with center (352, 105) and radius 53.
; PLAN: r0=352(x), r1=105(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 105
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
