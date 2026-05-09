; DESCRIPTION: Places a magenta line segment connecting (54, 200) to (207, 211).
; PLAN: r0=54(x1), r1=200(y1), r2=207(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 200
LDI r2, 207
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
