; DESCRIPTION: Places a purple circle of radius 21 at center (328, 157).
; PLAN: r0=328(x), r1=157(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 157
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
