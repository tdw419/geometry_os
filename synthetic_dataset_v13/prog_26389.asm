; DESCRIPTION: Draws a purple line from (230, 11) to (139, 169).
; PLAN: r0=230(x1), r1=11(y1), r2=139(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 11
LDI r2, 139
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
