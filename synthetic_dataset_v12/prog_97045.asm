; DESCRIPTION: Places a orange line segment connecting (79, 11) to (349, 94).
; PLAN: r0=79(x1), r1=11(y1), r2=349(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 11
LDI r2, 349
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
