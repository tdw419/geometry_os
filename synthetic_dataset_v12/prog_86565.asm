; DESCRIPTION: Draws a magenta line from (14, 216) to (56, 104).
; PLAN: r0=14(x1), r1=216(y1), r2=56(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 216
LDI r2, 56
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
