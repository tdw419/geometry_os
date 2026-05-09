; DESCRIPTION: Renders a purple disk with center (145, 94) and radius 31.
; PLAN: r0=145(x), r1=94(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 94
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
