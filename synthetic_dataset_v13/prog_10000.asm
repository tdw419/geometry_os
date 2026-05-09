; DESCRIPTION: Places a blue line segment connecting (26, 190) to (124, 136).
; PLAN: r0=26(x1), r1=190(y1), r2=124(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 190
LDI r2, 124
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
