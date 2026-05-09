; DESCRIPTION: Renders a purple disk with center (238, 127) and radius 69.
; PLAN: r0=238(x), r1=127(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 127
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
