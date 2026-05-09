; DESCRIPTION: Places a blue line segment connecting (216, 169) to (465, 57).
; PLAN: r0=216(x1), r1=169(y1), r2=465(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 169
LDI r2, 465
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
