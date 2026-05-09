; DESCRIPTION: Renders a purple disk with center (99, 135) and radius 45.
; PLAN: r0=99(x), r1=135(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 135
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
