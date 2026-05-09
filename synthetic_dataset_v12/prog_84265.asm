; DESCRIPTION: Places a magenta line segment connecting (134, 57) to (77, 11).
; PLAN: r0=134(x1), r1=57(y1), r2=77(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 57
LDI r2, 77
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
