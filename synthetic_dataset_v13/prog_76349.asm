; DESCRIPTION: Draws a red line from (489, 152) to (423, 44).
; PLAN: r0=489(x1), r1=152(y1), r2=423(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 152
LDI r2, 423
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
