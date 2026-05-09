; DESCRIPTION: Draws a magenta line from (211, 169) to (438, 95).
; PLAN: r0=211(x1), r1=169(y1), r2=438(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 169
LDI r2, 438
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
