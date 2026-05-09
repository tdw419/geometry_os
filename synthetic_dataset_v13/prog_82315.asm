; DESCRIPTION: Places a blue line segment connecting (136, 24) to (216, 26).
; PLAN: r0=136(x1), r1=24(y1), r2=216(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 24
LDI r2, 216
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
