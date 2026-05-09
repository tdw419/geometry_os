; DESCRIPTION: Draws a purple line from (102, 168) to (147, 255).
; PLAN: r0=102(x1), r1=168(y1), r2=147(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 168
LDI r2, 147
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
