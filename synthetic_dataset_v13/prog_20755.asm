; DESCRIPTION: Places a magenta line segment connecting (145, 178) to (432, 207).
; PLAN: r0=145(x1), r1=178(y1), r2=432(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 178
LDI r2, 432
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
