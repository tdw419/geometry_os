; DESCRIPTION: Draws a purple line from (249, 115) to (133, 102).
; PLAN: r0=249(x1), r1=115(y1), r2=133(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 115
LDI r2, 133
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
