; DESCRIPTION: Draws a magenta line from (311, 138) to (378, 22).
; PLAN: r0=311(x1), r1=138(y1), r2=378(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 138
LDI r2, 378
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
