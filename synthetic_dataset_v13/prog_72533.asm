; DESCRIPTION: Draws a red line from (57, 35) to (323, 110).
; PLAN: r0=57(x1), r1=35(y1), r2=323(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 35
LDI r2, 323
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
