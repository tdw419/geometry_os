; DESCRIPTION: Draws a purple line from (362, 241) to (163, 179).
; PLAN: r0=362(x1), r1=241(y1), r2=163(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 241
LDI r2, 163
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
