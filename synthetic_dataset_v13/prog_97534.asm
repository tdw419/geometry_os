; DESCRIPTION: Places a magenta line segment connecting (34, 100) to (249, 40).
; PLAN: r0=34(x1), r1=100(y1), r2=249(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 100
LDI r2, 249
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
