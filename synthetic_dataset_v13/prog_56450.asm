; DESCRIPTION: Places a magenta line segment connecting (311, 4) to (170, 58).
; PLAN: r0=311(x1), r1=4(y1), r2=170(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 4
LDI r2, 170
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
