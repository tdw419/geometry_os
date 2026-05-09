; DESCRIPTION: Draws a magenta line from (158, 118) to (400, 90).
; PLAN: r0=158(x1), r1=118(y1), r2=400(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 118
LDI r2, 400
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
