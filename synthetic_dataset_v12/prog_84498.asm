; DESCRIPTION: Renders a purple disk with center (195, 161) and radius 14.
; PLAN: r0=195(x), r1=161(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 161
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
