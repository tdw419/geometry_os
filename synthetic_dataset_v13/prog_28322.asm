; DESCRIPTION: Places a magenta line segment connecting (20, 133) to (454, 141).
; PLAN: r0=20(x1), r1=133(y1), r2=454(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 133
LDI r2, 454
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
