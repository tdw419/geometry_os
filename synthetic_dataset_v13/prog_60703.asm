; DESCRIPTION: Places a magenta line segment connecting (473, 240) to (486, 216).
; PLAN: r0=473(x1), r1=240(y1), r2=486(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 240
LDI r2, 486
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
