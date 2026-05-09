; DESCRIPTION: Places a yellow circle of radius 66 at center (308, 163).
; PLAN: r0=308(x), r1=163(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 163
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
