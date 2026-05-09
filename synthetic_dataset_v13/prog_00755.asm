; DESCRIPTION: Draws a red line from (351, 7) to (273, 34).
; PLAN: r0=351(x1), r1=7(y1), r2=273(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 7
LDI r2, 273
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
