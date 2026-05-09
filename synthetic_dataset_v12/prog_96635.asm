; DESCRIPTION: Draws a purple line from (68, 157) to (5, 105).
; PLAN: r0=68(x1), r1=157(y1), r2=5(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 157
LDI r2, 5
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
