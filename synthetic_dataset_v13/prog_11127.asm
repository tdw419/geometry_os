; DESCRIPTION: Renders a purple disk with center (110, 78) and radius 61.
; PLAN: r0=110(x), r1=78(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 78
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
