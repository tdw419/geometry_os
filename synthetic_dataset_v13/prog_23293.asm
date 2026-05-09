; DESCRIPTION: Places a magenta line segment connecting (508, 229) to (428, 60).
; PLAN: r0=508(x1), r1=229(y1), r2=428(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 229
LDI r2, 428
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
