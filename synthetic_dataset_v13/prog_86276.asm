; DESCRIPTION: Places a magenta line segment connecting (12, 11) to (216, 59).
; PLAN: r0=12(x1), r1=11(y1), r2=216(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 11
LDI r2, 216
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
