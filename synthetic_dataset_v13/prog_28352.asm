; DESCRIPTION: Places a magenta line segment connecting (8, 105) to (311, 14).
; PLAN: r0=8(x1), r1=105(y1), r2=311(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 105
LDI r2, 311
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
