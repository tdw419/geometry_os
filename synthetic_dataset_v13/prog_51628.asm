; DESCRIPTION: Draws a purple line from (455, 106) to (353, 94).
; PLAN: r0=455(x1), r1=106(y1), r2=353(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 106
LDI r2, 353
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
