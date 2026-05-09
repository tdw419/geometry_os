; DESCRIPTION: Places a purple circle of radius 38 at center (144, 204).
; PLAN: r0=144(x), r1=204(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 204
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
