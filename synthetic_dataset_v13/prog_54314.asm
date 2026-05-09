; DESCRIPTION: Renders a purple disk with center (304, 46) and radius 45.
; PLAN: r0=304(x), r1=46(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 46
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
