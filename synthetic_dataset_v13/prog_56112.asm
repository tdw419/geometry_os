; DESCRIPTION: Draws a magenta line from (505, 22) to (252, 155).
; PLAN: r0=505(x1), r1=22(y1), r2=252(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 22
LDI r2, 252
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
