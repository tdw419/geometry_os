; DESCRIPTION: Draws a purple line from (231, 201) to (50, 53).
; PLAN: r0=231(x1), r1=201(y1), r2=50(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 201
LDI r2, 50
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
