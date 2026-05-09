; DESCRIPTION: Draws a magenta line from (332, 118) to (378, 136).
; PLAN: r0=332(x1), r1=118(y1), r2=378(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 118
LDI r2, 378
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
