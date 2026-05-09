; DESCRIPTION: Places a orange line segment connecting (143, 85) to (368, 163).
; PLAN: r0=143(x1), r1=85(y1), r2=368(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 85
LDI r2, 368
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
