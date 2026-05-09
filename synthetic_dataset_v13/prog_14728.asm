; DESCRIPTION: Renders a purple disk with center (35, 17) and radius 16.
; PLAN: r0=35(x), r1=17(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 17
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
