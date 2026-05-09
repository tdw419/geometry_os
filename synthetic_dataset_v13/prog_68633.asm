; DESCRIPTION: Draws a red line from (109, 218) to (323, 152).
; PLAN: r0=109(x1), r1=218(y1), r2=323(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 218
LDI r2, 323
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
