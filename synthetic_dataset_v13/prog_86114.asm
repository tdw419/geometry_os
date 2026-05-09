; DESCRIPTION: Places a orange line segment connecting (102, 149) to (427, 103).
; PLAN: r0=102(x1), r1=149(y1), r2=427(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 149
LDI r2, 427
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
