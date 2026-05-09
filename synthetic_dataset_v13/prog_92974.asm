; DESCRIPTION: Draws a blue line from (147, 247) to (172, 207).
; PLAN: r0=147(x1), r1=247(y1), r2=172(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 247
LDI r2, 172
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
