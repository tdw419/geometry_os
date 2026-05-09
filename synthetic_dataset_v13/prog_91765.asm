; DESCRIPTION: Draws a red line from (147, 194) to (364, 141).
; PLAN: r0=147(x1), r1=194(y1), r2=364(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 194
LDI r2, 364
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
