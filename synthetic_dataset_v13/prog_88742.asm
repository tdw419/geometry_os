; DESCRIPTION: Places a orange line segment connecting (318, 150) to (107, 127).
; PLAN: r0=318(x1), r1=150(y1), r2=107(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 150
LDI r2, 107
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
