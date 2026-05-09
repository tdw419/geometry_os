; DESCRIPTION: Places a magenta line segment connecting (453, 102) to (150, 89).
; PLAN: r0=453(x1), r1=102(y1), r2=150(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 102
LDI r2, 150
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
