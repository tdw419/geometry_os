; DESCRIPTION: Draws a purple line from (212, 25) to (24, 169).
; PLAN: r0=212(x1), r1=25(y1), r2=24(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 25
LDI r2, 24
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
