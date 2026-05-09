; DESCRIPTION: Renders a purple disk with center (477, 113) and radius 16.
; PLAN: r0=477(x), r1=113(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 113
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
