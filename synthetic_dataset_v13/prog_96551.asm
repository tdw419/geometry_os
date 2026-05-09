; DESCRIPTION: Places a magenta line segment connecting (0, 110) to (63, 131).
; PLAN: r0=0(x1), r1=110(y1), r2=63(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 110
LDI r2, 63
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
