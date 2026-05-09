; DESCRIPTION: Draws a purple line from (89, 173) to (132, 157).
; PLAN: r0=89(x1), r1=173(y1), r2=132(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 173
LDI r2, 132
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
