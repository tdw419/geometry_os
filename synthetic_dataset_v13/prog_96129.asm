; DESCRIPTION: Places a blue line segment connecting (86, 169) to (1, 19).
; PLAN: r0=86(x1), r1=169(y1), r2=1(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 169
LDI r2, 1
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
