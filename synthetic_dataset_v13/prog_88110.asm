; DESCRIPTION: Places a red line segment connecting (37, 91) to (451, 246).
; PLAN: r0=37(x1), r1=91(y1), r2=451(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 91
LDI r2, 451
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
