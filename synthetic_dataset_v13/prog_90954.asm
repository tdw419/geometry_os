; DESCRIPTION: Places a magenta line segment connecting (158, 181) to (132, 20).
; PLAN: r0=158(x1), r1=181(y1), r2=132(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 181
LDI r2, 132
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
