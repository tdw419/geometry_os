; DESCRIPTION: Places a orange circle of radius 37 at center (468, 155).
; PLAN: r0=468(x), r1=155(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 155
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
