; DESCRIPTION: Places a black circle of radius 72 at center (149, 97).
; PLAN: r0=149(x), r1=97(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 97
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
