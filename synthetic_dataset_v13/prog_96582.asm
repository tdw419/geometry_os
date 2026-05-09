; DESCRIPTION: Places a magenta line segment connecting (142, 216) to (90, 21).
; PLAN: r0=142(x1), r1=216(y1), r2=90(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 216
LDI r2, 90
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
