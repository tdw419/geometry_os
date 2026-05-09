; DESCRIPTION: Places a blue line segment connecting (44, 38) to (140, 62).
; PLAN: r0=44(x1), r1=38(y1), r2=140(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 38
LDI r2, 140
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
