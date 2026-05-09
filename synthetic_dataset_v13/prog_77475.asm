; DESCRIPTION: Places a red line segment connecting (466, 118) to (318, 208).
; PLAN: r0=466(x1), r1=118(y1), r2=318(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 118
LDI r2, 318
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
