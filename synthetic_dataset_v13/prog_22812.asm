; DESCRIPTION: Draws a purple line from (117, 14) to (2, 157).
; PLAN: r0=117(x1), r1=14(y1), r2=2(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 14
LDI r2, 2
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
