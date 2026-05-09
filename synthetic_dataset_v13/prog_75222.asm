; DESCRIPTION: Places a magenta line segment connecting (378, 162) to (75, 68).
; PLAN: r0=378(x1), r1=162(y1), r2=75(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 162
LDI r2, 75
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
