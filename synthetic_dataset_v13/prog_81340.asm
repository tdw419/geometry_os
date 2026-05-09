; DESCRIPTION: Places a green circle of radius 70 at center (133, 97).
; PLAN: r0=133(x), r1=97(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 97
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
