; DESCRIPTION: Draws a purple line from (511, 162) to (417, 163).
; PLAN: r0=511(x1), r1=162(y1), r2=417(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 162
LDI r2, 417
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
