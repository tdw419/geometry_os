; DESCRIPTION: Places a magenta line segment connecting (391, 211) to (428, 11).
; PLAN: r0=391(x1), r1=211(y1), r2=428(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 211
LDI r2, 428
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
