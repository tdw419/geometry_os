; DESCRIPTION: Places a orange line segment connecting (142, 149) to (337, 79).
; PLAN: r0=142(x1), r1=149(y1), r2=337(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 149
LDI r2, 337
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
