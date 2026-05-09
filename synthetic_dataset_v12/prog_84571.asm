; DESCRIPTION: Places a orange circle of radius 20 at center (319, 89).
; PLAN: r0=319(x), r1=89(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 89
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
