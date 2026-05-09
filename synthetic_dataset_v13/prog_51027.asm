; DESCRIPTION: Places a magenta line segment connecting (420, 135) to (314, 140).
; PLAN: r0=420(x1), r1=135(y1), r2=314(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 135
LDI r2, 314
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
