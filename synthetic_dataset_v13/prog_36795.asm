; DESCRIPTION: Places a orange line segment connecting (395, 197) to (156, 79).
; PLAN: r0=395(x1), r1=197(y1), r2=156(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 197
LDI r2, 156
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
