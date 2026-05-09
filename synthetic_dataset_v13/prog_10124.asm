; DESCRIPTION: Places a purple line segment connecting (448, 198) to (243, 148).
; PLAN: r0=448(x1), r1=198(y1), r2=243(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 198
LDI r2, 243
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
