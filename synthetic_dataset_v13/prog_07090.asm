; DESCRIPTION: Places a blue line segment connecting (477, 241) to (105, 44).
; PLAN: r0=477(x1), r1=241(y1), r2=105(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 241
LDI r2, 105
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
