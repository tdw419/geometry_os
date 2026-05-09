; DESCRIPTION: Places a magenta line segment connecting (158, 249) to (315, 156).
; PLAN: r0=158(x1), r1=249(y1), r2=315(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 249
LDI r2, 315
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
