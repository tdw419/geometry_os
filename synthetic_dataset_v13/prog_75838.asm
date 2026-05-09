; DESCRIPTION: Draws a magenta line from (430, 87) to (122, 97).
; PLAN: r0=430(x1), r1=87(y1), r2=122(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 87
LDI r2, 122
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
