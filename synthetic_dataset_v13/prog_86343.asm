; DESCRIPTION: Places a magenta line segment connecting (428, 26) to (334, 23).
; PLAN: r0=428(x1), r1=26(y1), r2=334(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 26
LDI r2, 334
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
