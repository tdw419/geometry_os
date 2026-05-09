; DESCRIPTION: Places a purple line segment connecting (243, 92) to (147, 66).
; PLAN: r0=243(x1), r1=92(y1), r2=147(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 92
LDI r2, 147
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
