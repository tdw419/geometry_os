; DESCRIPTION: Draws a purple line from (179, 153) to (114, 163).
; PLAN: r0=179(x1), r1=153(y1), r2=114(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 153
LDI r2, 114
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
