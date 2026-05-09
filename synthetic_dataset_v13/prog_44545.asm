; DESCRIPTION: Renders a purple disk with center (324, 121) and radius 70.
; PLAN: r0=324(x), r1=121(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 121
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
