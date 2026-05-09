; DESCRIPTION: Draws a purple line from (501, 251) to (296, 202).
; PLAN: r0=501(x1), r1=251(y1), r2=296(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 251
LDI r2, 296
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
