; DESCRIPTION: Places a magenta line segment connecting (322, 110) to (334, 94).
; PLAN: r0=322(x1), r1=110(y1), r2=334(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 110
LDI r2, 334
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
