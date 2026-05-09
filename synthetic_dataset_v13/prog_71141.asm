; DESCRIPTION: Places a purple circle of radius 39 at center (208, 104).
; PLAN: r0=208(x), r1=104(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 104
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
