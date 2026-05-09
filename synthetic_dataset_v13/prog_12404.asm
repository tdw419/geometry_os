; DESCRIPTION: Draws a purple line from (339, 220) to (418, 188).
; PLAN: r0=339(x1), r1=220(y1), r2=418(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 220
LDI r2, 418
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
