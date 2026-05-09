; DESCRIPTION: Places a orange circle of radius 35 at center (37, 161).
; PLAN: r0=37(x), r1=161(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 161
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
