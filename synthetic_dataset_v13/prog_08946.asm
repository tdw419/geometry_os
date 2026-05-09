; DESCRIPTION: Places a black circle of radius 75 at center (90, 97).
; PLAN: r0=90(x), r1=97(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 97
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
