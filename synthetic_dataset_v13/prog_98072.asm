; DESCRIPTION: Places a magenta line segment connecting (47, 5) to (52, 163).
; PLAN: r0=47(x1), r1=5(y1), r2=52(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 5
LDI r2, 52
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
