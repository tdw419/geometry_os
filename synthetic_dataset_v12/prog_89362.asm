; DESCRIPTION: Places a orange line segment connecting (124, 168) to (273, 188).
; PLAN: r0=124(x1), r1=168(y1), r2=273(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 168
LDI r2, 273
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
