; DESCRIPTION: Places a orange line segment connecting (230, 132) to (489, 127).
; PLAN: r0=230(x1), r1=132(y1), r2=489(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 132
LDI r2, 489
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
