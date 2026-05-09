; DESCRIPTION: Draws a purple line from (489, 168) to (445, 90).
; PLAN: r0=489(x1), r1=168(y1), r2=445(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 168
LDI r2, 445
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
