; DESCRIPTION: Places a yellow circle of radius 24 at center (37, 229).
; PLAN: r0=37(x), r1=229(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 229
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
