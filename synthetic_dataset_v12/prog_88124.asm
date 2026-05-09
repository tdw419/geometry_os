; DESCRIPTION: Places a magenta line segment connecting (477, 133) to (388, 165).
; PLAN: r0=477(x1), r1=133(y1), r2=388(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 133
LDI r2, 388
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
