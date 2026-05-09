; DESCRIPTION: Renders a purple disk with center (456, 177) and radius 33.
; PLAN: r0=456(x), r1=177(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 177
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
