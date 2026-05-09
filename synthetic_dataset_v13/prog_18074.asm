; DESCRIPTION: Places a blue line segment connecting (322, 18) to (135, 44).
; PLAN: r0=322(x1), r1=18(y1), r2=135(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 18
LDI r2, 135
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
