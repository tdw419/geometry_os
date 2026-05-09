; DESCRIPTION: Places a blue line segment connecting (248, 97) to (181, 194).
; PLAN: r0=248(x1), r1=97(y1), r2=181(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 97
LDI r2, 181
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
