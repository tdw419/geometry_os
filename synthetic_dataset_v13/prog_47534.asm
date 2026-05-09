; DESCRIPTION: Places a magenta line segment connecting (395, 156) to (119, 197).
; PLAN: r0=395(x1), r1=156(y1), r2=119(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 156
LDI r2, 119
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
