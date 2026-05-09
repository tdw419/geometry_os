; DESCRIPTION: Places a yellow line segment connecting (220, 170) to (489, 87).
; PLAN: r0=220(x1), r1=170(y1), r2=489(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 170
LDI r2, 489
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
