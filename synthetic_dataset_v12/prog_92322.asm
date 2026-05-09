; DESCRIPTION: Draws a blue line from (489, 154) to (353, 252).
; PLAN: r0=489(x1), r1=154(y1), r2=353(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 154
LDI r2, 353
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
