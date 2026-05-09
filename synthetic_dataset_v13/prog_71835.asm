; DESCRIPTION: Places a magenta line segment connecting (260, 68) to (361, 158).
; PLAN: r0=260(x1), r1=68(y1), r2=361(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 68
LDI r2, 361
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
