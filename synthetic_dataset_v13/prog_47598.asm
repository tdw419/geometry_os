; DESCRIPTION: Places a orange line segment connecting (38, 149) to (408, 133).
; PLAN: r0=38(x1), r1=149(y1), r2=408(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 149
LDI r2, 408
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
