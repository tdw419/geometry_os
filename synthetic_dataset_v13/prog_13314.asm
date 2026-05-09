; DESCRIPTION: Draws a purple line from (137, 174) to (332, 206).
; PLAN: r0=137(x1), r1=174(y1), r2=332(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 174
LDI r2, 332
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
