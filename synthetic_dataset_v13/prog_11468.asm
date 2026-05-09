; DESCRIPTION: Draws a purple line from (281, 37) to (350, 97).
; PLAN: r0=281(x1), r1=37(y1), r2=350(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 37
LDI r2, 350
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
