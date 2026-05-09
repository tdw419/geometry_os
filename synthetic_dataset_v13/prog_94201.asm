; DESCRIPTION: Places a orange line segment connecting (449, 245) to (115, 21).
; PLAN: r0=449(x1), r1=245(y1), r2=115(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 245
LDI r2, 115
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
