; DESCRIPTION: Places a red line segment connecting (315, 84) to (323, 150).
; PLAN: r0=315(x1), r1=84(y1), r2=323(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 84
LDI r2, 323
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
