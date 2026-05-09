; DESCRIPTION: Draws a purple line from (231, 5) to (198, 183).
; PLAN: r0=231(x1), r1=5(y1), r2=198(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 5
LDI r2, 198
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
