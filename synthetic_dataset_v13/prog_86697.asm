; DESCRIPTION: Draws a purple line from (299, 187) to (315, 162).
; PLAN: r0=299(x1), r1=187(y1), r2=315(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 187
LDI r2, 315
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
