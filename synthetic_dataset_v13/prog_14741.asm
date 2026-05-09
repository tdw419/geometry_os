; DESCRIPTION: Places a magenta line segment connecting (74, 23) to (438, 22).
; PLAN: r0=74(x1), r1=23(y1), r2=438(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 23
LDI r2, 438
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
