; DESCRIPTION: Renders a purple disk with center (229, 121) and radius 17.
; PLAN: r0=229(x), r1=121(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 121
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
