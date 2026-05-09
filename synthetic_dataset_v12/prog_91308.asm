; DESCRIPTION: Places a blue circle of radius 56 at center (297, 97).
; PLAN: r0=297(x), r1=97(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 97
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
