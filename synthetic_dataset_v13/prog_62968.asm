; DESCRIPTION: Renders a magenta line between points (110, 191) and (355, 67).
; PLAN: r0=110(x1), r1=191(y1), r2=355(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 191
LDI r2, 355
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
