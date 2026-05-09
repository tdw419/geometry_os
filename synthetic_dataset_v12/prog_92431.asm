; DESCRIPTION: Places a magenta line segment connecting (115, 191) to (303, 118).
; PLAN: r0=115(x1), r1=191(y1), r2=303(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 191
LDI r2, 303
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
