; DESCRIPTION: Draws a orange line from (468, 221) to (489, 44).
; PLAN: r0=468(x1), r1=221(y1), r2=489(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 221
LDI r2, 489
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
