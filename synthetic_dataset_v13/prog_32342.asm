; DESCRIPTION: Draws a red line from (323, 202) to (504, 4).
; PLAN: r0=323(x1), r1=202(y1), r2=504(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 202
LDI r2, 504
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
