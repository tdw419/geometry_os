; DESCRIPTION: Renders a purple disk with center (223, 198) and radius 34.
; PLAN: r0=223(x), r1=198(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 198
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
