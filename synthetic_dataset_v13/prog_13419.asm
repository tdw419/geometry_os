; DESCRIPTION: Draws a magenta line from (249, 216) to (31, 30).
; PLAN: r0=249(x1), r1=216(y1), r2=31(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 216
LDI r2, 31
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
