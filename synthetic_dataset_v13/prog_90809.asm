; DESCRIPTION: Draws a magenta line from (508, 156) to (468, 23).
; PLAN: r0=508(x1), r1=156(y1), r2=468(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 156
LDI r2, 468
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
