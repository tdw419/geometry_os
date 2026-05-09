; DESCRIPTION: Draws a magenta line from (213, 216) to (451, 0).
; PLAN: r0=213(x1), r1=216(y1), r2=451(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 216
LDI r2, 451
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
