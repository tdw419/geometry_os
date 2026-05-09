; DESCRIPTION: Places a orange line segment connecting (133, 104) to (433, 247).
; PLAN: r0=133(x1), r1=104(y1), r2=433(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 104
LDI r2, 433
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
