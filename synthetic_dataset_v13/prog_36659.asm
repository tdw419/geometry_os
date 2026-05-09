; DESCRIPTION: Draws a red line from (335, 201) to (315, 10).
; PLAN: r0=335(x1), r1=201(y1), r2=315(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 201
LDI r2, 315
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
