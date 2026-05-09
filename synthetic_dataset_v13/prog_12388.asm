; DESCRIPTION: Places a blue line segment connecting (325, 248) to (411, 44).
; PLAN: r0=325(x1), r1=248(y1), r2=411(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 248
LDI r2, 411
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
