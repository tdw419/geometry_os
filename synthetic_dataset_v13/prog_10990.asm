; DESCRIPTION: Places a blue circle of radius 68 at center (98, 89).
; PLAN: r0=98(x), r1=89(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 89
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
