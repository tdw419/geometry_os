; DESCRIPTION: Places a green circle of radius 61 at center (314, 120).
; PLAN: r0=314(x), r1=120(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 120
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
