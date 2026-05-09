; DESCRIPTION: Places a orange line segment connecting (367, 101) to (273, 139).
; PLAN: r0=367(x1), r1=101(y1), r2=273(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 101
LDI r2, 273
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
