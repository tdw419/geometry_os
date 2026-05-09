; DESCRIPTION: Places a magenta line segment connecting (400, 216) to (246, 17).
; PLAN: r0=400(x1), r1=216(y1), r2=246(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 216
LDI r2, 246
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
