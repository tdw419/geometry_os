; DESCRIPTION: Places a magenta line segment connecting (324, 125) to (102, 251).
; PLAN: r0=324(x1), r1=125(y1), r2=102(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 125
LDI r2, 102
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
