; DESCRIPTION: Places a green circle of radius 36 at center (37, 58).
; PLAN: r0=37(x), r1=58(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 58
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
