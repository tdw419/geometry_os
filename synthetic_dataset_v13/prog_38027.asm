; DESCRIPTION: Places a blue line segment connecting (86, 34) to (279, 66).
; PLAN: r0=86(x1), r1=34(y1), r2=279(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 34
LDI r2, 279
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
