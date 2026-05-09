; DESCRIPTION: Places a magenta line segment connecting (161, 34) to (246, 87).
; PLAN: r0=161(x1), r1=34(y1), r2=246(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 34
LDI r2, 246
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
