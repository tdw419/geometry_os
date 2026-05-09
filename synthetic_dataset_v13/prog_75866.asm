; DESCRIPTION: Draws a purple line from (288, 94) to (392, 112).
; PLAN: r0=288(x1), r1=94(y1), r2=392(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 94
LDI r2, 392
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
