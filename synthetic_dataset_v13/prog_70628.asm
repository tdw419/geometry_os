; DESCRIPTION: Draws a purple line from (372, 231) to (145, 88).
; PLAN: r0=372(x1), r1=231(y1), r2=145(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 231
LDI r2, 145
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
