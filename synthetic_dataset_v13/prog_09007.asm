; DESCRIPTION: Draws a magenta line from (104, 216) to (378, 3).
; PLAN: r0=104(x1), r1=216(y1), r2=378(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 216
LDI r2, 378
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
