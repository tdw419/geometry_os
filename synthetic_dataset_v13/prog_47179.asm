; DESCRIPTION: Places a orange line segment connecting (371, 79) to (411, 122).
; PLAN: r0=371(x1), r1=79(y1), r2=411(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 79
LDI r2, 411
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
