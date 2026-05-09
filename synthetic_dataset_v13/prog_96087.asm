; DESCRIPTION: Places a red circle of radius 24 at center (451, 119).
; PLAN: r0=451(x), r1=119(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 119
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
