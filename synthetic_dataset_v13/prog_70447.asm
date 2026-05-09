; DESCRIPTION: Places a orange circle of radius 13 at center (202, 145).
; PLAN: r0=202(x), r1=145(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 145
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
