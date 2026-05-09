; DESCRIPTION: Renders a purple disk with center (380, 75) and radius 38.
; PLAN: r0=380(x), r1=75(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 75
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
