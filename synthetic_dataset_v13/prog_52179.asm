; DESCRIPTION: Draws a purple line from (68, 142) to (261, 181).
; PLAN: r0=68(x1), r1=142(y1), r2=261(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 142
LDI r2, 261
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
