; DESCRIPTION: Draws a black line from (147, 169) to (177, 78).
; PLAN: r0=147(x1), r1=169(y1), r2=177(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 169
LDI r2, 177
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
