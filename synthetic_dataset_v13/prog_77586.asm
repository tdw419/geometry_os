; DESCRIPTION: Draws a purple line from (104, 169) to (279, 70).
; PLAN: r0=104(x1), r1=169(y1), r2=279(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 169
LDI r2, 279
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
