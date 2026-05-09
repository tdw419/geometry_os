; DESCRIPTION: Renders a purple disk with center (45, 31) and radius 19.
; PLAN: r0=45(x), r1=31(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 31
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
