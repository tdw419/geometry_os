; DESCRIPTION: Draws a purple line from (375, 201) to (352, 188).
; PLAN: r0=375(x1), r1=201(y1), r2=352(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 201
LDI r2, 352
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
