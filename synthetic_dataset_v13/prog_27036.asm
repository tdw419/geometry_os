; DESCRIPTION: Places a blue line segment connecting (269, 15) to (508, 149).
; PLAN: r0=269(x1), r1=15(y1), r2=508(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 15
LDI r2, 508
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
