; DESCRIPTION: Draws a purple line from (10, 157) to (132, 84).
; PLAN: r0=10(x1), r1=157(y1), r2=132(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 157
LDI r2, 132
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
