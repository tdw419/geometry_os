; DESCRIPTION: Places a magenta line segment connecting (4, 247) to (314, 31).
; PLAN: r0=4(x1), r1=247(y1), r2=314(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 247
LDI r2, 314
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
