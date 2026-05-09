; DESCRIPTION: Places a magenta line segment connecting (389, 110) to (29, 68).
; PLAN: r0=389(x1), r1=110(y1), r2=29(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 110
LDI r2, 29
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
