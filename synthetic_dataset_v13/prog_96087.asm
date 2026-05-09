; DESCRIPTION: Places a magenta line segment connecting (181, 186) to (106, 67).
; PLAN: r0=181(x1), r1=186(y1), r2=106(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 186
LDI r2, 106
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
