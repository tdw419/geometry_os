; DESCRIPTION: Renders a purple disk with center (182, 161) and radius 66.
; PLAN: r0=182(x), r1=161(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 161
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
