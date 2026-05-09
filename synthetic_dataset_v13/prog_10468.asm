; DESCRIPTION: Draws a purple line from (38, 212) to (181, 233).
; PLAN: r0=38(x1), r1=212(y1), r2=181(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 212
LDI r2, 181
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
