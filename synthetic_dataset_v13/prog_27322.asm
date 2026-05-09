; DESCRIPTION: Renders a purple disk with center (304, 80) and radius 13.
; PLAN: r0=304(x), r1=80(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 80
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
