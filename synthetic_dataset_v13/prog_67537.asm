; DESCRIPTION: Renders a magenta line between points (216, 92) and (28, 137).
; PLAN: r0=216(x1), r1=92(y1), r2=28(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 92
LDI r2, 28
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
