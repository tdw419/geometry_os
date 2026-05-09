; DESCRIPTION: Renders a purple disk with center (161, 215) and radius 17.
; PLAN: r0=161(x), r1=215(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 215
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
