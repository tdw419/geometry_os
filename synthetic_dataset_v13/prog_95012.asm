; DESCRIPTION: Places a magenta line segment connecting (438, 216) to (11, 217).
; PLAN: r0=438(x1), r1=216(y1), r2=11(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 216
LDI r2, 11
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
