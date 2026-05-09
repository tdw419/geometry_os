; DESCRIPTION: Renders a purple disk with center (94, 95) and radius 78.
; PLAN: r0=94(x), r1=95(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 95
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
