; DESCRIPTION: Draws a purple line from (249, 155) to (408, 50).
; PLAN: r0=249(x1), r1=155(y1), r2=408(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 155
LDI r2, 408
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
