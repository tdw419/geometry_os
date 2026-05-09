; DESCRIPTION: Places a magenta line segment connecting (510, 84) to (189, 179).
; PLAN: r0=510(x1), r1=84(y1), r2=189(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 84
LDI r2, 189
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
