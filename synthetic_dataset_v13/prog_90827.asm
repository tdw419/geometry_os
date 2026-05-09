; DESCRIPTION: Draws a purple line from (236, 53) to (185, 96).
; PLAN: r0=236(x1), r1=53(y1), r2=185(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 53
LDI r2, 185
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
