; DESCRIPTION: Places a magenta line segment connecting (489, 97) to (456, 79).
; PLAN: r0=489(x1), r1=97(y1), r2=456(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 97
LDI r2, 456
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
