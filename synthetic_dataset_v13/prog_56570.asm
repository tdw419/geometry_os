; DESCRIPTION: Places a blue circle of radius 32 at center (456, 97).
; PLAN: r0=456(x), r1=97(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 97
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
