; DESCRIPTION: Draws a green line from (147, 169) to (140, 77).
; PLAN: r0=147(x1), r1=169(y1), r2=140(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 169
LDI r2, 140
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
