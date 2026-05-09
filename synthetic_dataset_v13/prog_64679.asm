; DESCRIPTION: Places a magenta line segment connecting (89, 179) to (221, 68).
; PLAN: r0=89(x1), r1=179(y1), r2=221(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 179
LDI r2, 221
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
