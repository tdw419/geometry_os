; DESCRIPTION: Renders a purple disk with center (379, 113) and radius 25.
; PLAN: r0=379(x), r1=113(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 113
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
