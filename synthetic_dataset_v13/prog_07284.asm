; DESCRIPTION: Places a green circle of radius 36 at center (368, 216).
; PLAN: r0=368(x), r1=216(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 216
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
