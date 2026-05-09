; DESCRIPTION: Places a magenta line segment connecting (270, 133) to (111, 85).
; PLAN: r0=270(x1), r1=133(y1), r2=111(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 133
LDI r2, 111
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
