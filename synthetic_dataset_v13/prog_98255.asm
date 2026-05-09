; DESCRIPTION: Draws a red line from (489, 187) to (392, 193).
; PLAN: r0=489(x1), r1=187(y1), r2=392(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 187
LDI r2, 392
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
