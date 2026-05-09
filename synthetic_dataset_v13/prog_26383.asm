; DESCRIPTION: Renders a purple disk with center (189, 121) and radius 18.
; PLAN: r0=189(x), r1=121(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 121
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
