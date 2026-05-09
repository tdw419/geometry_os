; DESCRIPTION: Draws a purple line from (66, 5) to (505, 232).
; PLAN: r0=66(x1), r1=5(y1), r2=505(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 5
LDI r2, 505
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
