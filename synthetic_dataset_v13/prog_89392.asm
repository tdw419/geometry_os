; DESCRIPTION: Places a orange line segment connecting (142, 120) to (491, 231).
; PLAN: r0=142(x1), r1=120(y1), r2=491(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 120
LDI r2, 491
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
