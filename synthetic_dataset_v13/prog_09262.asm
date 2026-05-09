; DESCRIPTION: Draws a purple line from (164, 203) to (31, 163).
; PLAN: r0=164(x1), r1=203(y1), r2=31(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 203
LDI r2, 31
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
