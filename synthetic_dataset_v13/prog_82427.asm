; DESCRIPTION: Places a blue line segment connecting (322, 62) to (510, 203).
; PLAN: r0=322(x1), r1=62(y1), r2=510(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 62
LDI r2, 510
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
