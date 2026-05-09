; DESCRIPTION: Places a magenta line segment connecting (38, 212) to (142, 49).
; PLAN: r0=38(x1), r1=212(y1), r2=142(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 212
LDI r2, 142
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
