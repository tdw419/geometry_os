; DESCRIPTION: Places a red line segment connecting (65, 106) to (147, 202).
; PLAN: r0=65(x1), r1=106(y1), r2=147(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 106
LDI r2, 147
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
