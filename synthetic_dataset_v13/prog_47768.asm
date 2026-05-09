; DESCRIPTION: Renders a red line between points (185, 40) and (323, 118).
; PLAN: r0=185(x1), r1=40(y1), r2=323(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 40
LDI r2, 323
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
