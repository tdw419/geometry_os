; DESCRIPTION: Places a magenta line segment connecting (339, 216) to (347, 73).
; PLAN: r0=339(x1), r1=216(y1), r2=347(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 216
LDI r2, 347
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
