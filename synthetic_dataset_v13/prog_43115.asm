; DESCRIPTION: Places a magenta line segment connecting (54, 179) to (490, 196).
; PLAN: r0=54(x1), r1=179(y1), r2=490(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 179
LDI r2, 490
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
