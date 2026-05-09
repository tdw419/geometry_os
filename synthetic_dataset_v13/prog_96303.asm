; DESCRIPTION: Places a orange line segment connecting (218, 117) to (80, 201).
; PLAN: r0=218(x1), r1=117(y1), r2=80(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 117
LDI r2, 80
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
