; DESCRIPTION: Draws a purple line from (455, 103) to (407, 158).
; PLAN: r0=455(x1), r1=103(y1), r2=407(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 103
LDI r2, 407
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
