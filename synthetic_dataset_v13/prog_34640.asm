; DESCRIPTION: Places a purple circle of radius 66 at center (272, 131).
; PLAN: r0=272(x), r1=131(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 131
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
