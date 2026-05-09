; DESCRIPTION: Places a green circle of radius 10 at center (252, 216).
; PLAN: r0=252(x), r1=216(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 216
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
