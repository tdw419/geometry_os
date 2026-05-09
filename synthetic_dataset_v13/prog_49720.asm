; DESCRIPTION: Places a magenta line segment connecting (20, 147) to (179, 9).
; PLAN: r0=20(x1), r1=147(y1), r2=179(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 147
LDI r2, 179
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
