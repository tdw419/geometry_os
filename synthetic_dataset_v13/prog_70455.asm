; DESCRIPTION: Draws a purple line from (339, 5) to (261, 197).
; PLAN: r0=339(x1), r1=5(y1), r2=261(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 5
LDI r2, 261
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
