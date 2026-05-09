; DESCRIPTION: Places a blue line segment connecting (510, 230) to (322, 85).
; PLAN: r0=510(x1), r1=230(y1), r2=322(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 230
LDI r2, 322
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
