; DESCRIPTION: Draws a purple line from (32, 147) to (162, 96).
; PLAN: r0=32(x1), r1=147(y1), r2=162(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 147
LDI r2, 162
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
