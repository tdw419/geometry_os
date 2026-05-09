; DESCRIPTION: Draws a purple line from (103, 32) to (424, 97).
; PLAN: r0=103(x1), r1=32(y1), r2=424(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 32
LDI r2, 424
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
