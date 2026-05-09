; DESCRIPTION: Draws a red line from (426, 89) to (323, 154).
; PLAN: r0=426(x1), r1=89(y1), r2=323(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 89
LDI r2, 323
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
