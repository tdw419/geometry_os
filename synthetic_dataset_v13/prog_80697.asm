; DESCRIPTION: Places a orange line segment connecting (376, 174) to (72, 84).
; PLAN: r0=376(x1), r1=174(y1), r2=72(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 174
LDI r2, 72
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
