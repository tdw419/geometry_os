; DESCRIPTION: Places a orange circle of radius 75 at center (183, 99).
; PLAN: r0=183(x), r1=99(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 99
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
