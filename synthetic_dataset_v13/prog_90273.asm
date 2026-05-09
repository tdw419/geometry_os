; DESCRIPTION: Places a blue circle of radius 44 at center (123, 97).
; PLAN: r0=123(x), r1=97(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 97
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
