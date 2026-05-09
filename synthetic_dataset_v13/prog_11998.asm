; DESCRIPTION: Places a orange line segment connecting (236, 70) to (464, 168).
; PLAN: r0=236(x1), r1=70(y1), r2=464(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 70
LDI r2, 464
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
