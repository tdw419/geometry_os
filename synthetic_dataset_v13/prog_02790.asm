; DESCRIPTION: Draws a magenta line from (147, 68) to (466, 77).
; PLAN: r0=147(x1), r1=68(y1), r2=466(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 68
LDI r2, 466
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
