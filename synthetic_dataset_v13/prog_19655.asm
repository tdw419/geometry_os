; DESCRIPTION: Places a magenta line segment connecting (216, 1) to (16, 30).
; PLAN: r0=216(x1), r1=1(y1), r2=16(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 1
LDI r2, 16
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
