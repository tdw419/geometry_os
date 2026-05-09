; DESCRIPTION: Places a green circle of radius 22 at center (383, 37).
; PLAN: r0=383(x), r1=37(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 37
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
