; DESCRIPTION: Draws a purple line from (356, 118) to (134, 159).
; PLAN: r0=356(x1), r1=118(y1), r2=134(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 118
LDI r2, 134
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
