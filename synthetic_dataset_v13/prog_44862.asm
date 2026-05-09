; DESCRIPTION: Places a magenta line segment connecting (112, 91) to (370, 58).
; PLAN: r0=112(x1), r1=91(y1), r2=370(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 91
LDI r2, 370
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
