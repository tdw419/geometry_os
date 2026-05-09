; DESCRIPTION: Renders a purple disk with center (294, 119) and radius 45.
; PLAN: r0=294(x), r1=119(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 119
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
