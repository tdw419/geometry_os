; DESCRIPTION: Places a magenta line segment connecting (15, 91) to (258, 1).
; PLAN: r0=15(x1), r1=91(y1), r2=258(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 91
LDI r2, 258
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
