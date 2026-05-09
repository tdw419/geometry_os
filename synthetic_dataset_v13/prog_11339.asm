; DESCRIPTION: Renders a red line between points (158, 212) and (323, 33).
; PLAN: r0=158(x1), r1=212(y1), r2=323(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 212
LDI r2, 323
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
