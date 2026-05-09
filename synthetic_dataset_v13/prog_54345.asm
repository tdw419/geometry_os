; DESCRIPTION: Draws a magenta line from (102, 91) to (319, 35).
; PLAN: r0=102(x1), r1=91(y1), r2=319(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 91
LDI r2, 319
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
