; DESCRIPTION: Renders a purple disk with center (74, 184) and radius 56.
; PLAN: r0=74(x), r1=184(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 184
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
