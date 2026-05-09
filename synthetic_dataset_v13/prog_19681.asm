; DESCRIPTION: Places a magenta line segment connecting (222, 179) to (10, 178).
; PLAN: r0=222(x1), r1=179(y1), r2=10(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 179
LDI r2, 10
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
