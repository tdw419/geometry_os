; DESCRIPTION: Places a magenta line segment connecting (34, 46) to (64, 216).
; PLAN: r0=34(x1), r1=46(y1), r2=64(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 46
LDI r2, 64
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
