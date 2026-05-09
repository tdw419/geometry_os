; DESCRIPTION: Places a magenta line segment connecting (158, 22) to (285, 217).
; PLAN: r0=158(x1), r1=22(y1), r2=285(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 22
LDI r2, 285
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
