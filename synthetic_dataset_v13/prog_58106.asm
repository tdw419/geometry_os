; DESCRIPTION: Places a red circle of radius 61 at center (451, 91).
; PLAN: r0=451(x), r1=91(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 91
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
