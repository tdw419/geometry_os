; DESCRIPTION: Places a orange line segment connecting (405, 218) to (149, 81).
; PLAN: r0=405(x1), r1=218(y1), r2=149(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 218
LDI r2, 149
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
