; DESCRIPTION: Places a magenta line segment connecting (270, 49) to (149, 212).
; PLAN: r0=270(x1), r1=49(y1), r2=149(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 49
LDI r2, 149
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
