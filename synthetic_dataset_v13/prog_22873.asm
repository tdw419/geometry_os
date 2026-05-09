; DESCRIPTION: Draws a purple line from (297, 117) to (87, 3).
; PLAN: r0=297(x1), r1=117(y1), r2=87(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 117
LDI r2, 87
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
