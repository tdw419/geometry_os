; DESCRIPTION: Draws a purple line from (396, 115) to (135, 87).
; PLAN: r0=396(x1), r1=115(y1), r2=135(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 115
LDI r2, 135
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
