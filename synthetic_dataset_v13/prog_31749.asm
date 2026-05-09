; DESCRIPTION: Places a green circle of radius 49 at center (131, 163).
; PLAN: r0=131(x), r1=163(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 163
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
