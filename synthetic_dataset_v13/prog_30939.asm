; DESCRIPTION: Places a green circle of radius 15 at center (484, 49).
; PLAN: r0=484(x), r1=49(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 484
LDI r1, 49
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
