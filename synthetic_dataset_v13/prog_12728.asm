; DESCRIPTION: Places a magenta line segment connecting (265, 84) to (102, 94).
; PLAN: r0=265(x1), r1=84(y1), r2=102(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 84
LDI r2, 102
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
