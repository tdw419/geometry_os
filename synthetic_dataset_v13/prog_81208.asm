; DESCRIPTION: Draws a red line from (359, 191) to (342, 97).
; PLAN: r0=359(x1), r1=191(y1), r2=342(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 191
LDI r2, 342
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
