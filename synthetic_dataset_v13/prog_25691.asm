; DESCRIPTION: Places a purple circle of radius 60 at center (232, 75).
; PLAN: r0=232(x), r1=75(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 75
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
