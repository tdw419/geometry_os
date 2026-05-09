; DESCRIPTION: Places a magenta line segment connecting (452, 217) to (347, 11).
; PLAN: r0=452(x1), r1=217(y1), r2=347(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 217
LDI r2, 347
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
