; DESCRIPTION: Draws a purple line from (75, 1) to (350, 157).
; PLAN: r0=75(x1), r1=1(y1), r2=350(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 1
LDI r2, 350
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
