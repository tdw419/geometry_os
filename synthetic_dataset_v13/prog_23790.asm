; DESCRIPTION: Draws a magenta line from (451, 97) to (477, 158).
; PLAN: r0=451(x1), r1=97(y1), r2=477(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 97
LDI r2, 477
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
