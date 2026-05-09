; DESCRIPTION: Draws a purple line from (44, 66) to (510, 97).
; PLAN: r0=44(x1), r1=66(y1), r2=510(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 66
LDI r2, 510
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
