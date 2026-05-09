; DESCRIPTION: Renders a purple disk with center (121, 186) and radius 69.
; PLAN: r0=121(x), r1=186(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 186
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
