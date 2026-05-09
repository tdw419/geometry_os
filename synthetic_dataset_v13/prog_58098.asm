; DESCRIPTION: Draws a purple line from (489, 57) to (406, 214).
; PLAN: r0=489(x1), r1=57(y1), r2=406(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 57
LDI r2, 406
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
