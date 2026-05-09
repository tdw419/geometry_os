; DESCRIPTION: Renders a purple disk with center (244, 132) and radius 19.
; PLAN: r0=244(x), r1=132(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 132
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
