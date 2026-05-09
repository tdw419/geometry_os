; DESCRIPTION: Places a blue line segment connecting (475, 181) to (251, 188).
; PLAN: r0=475(x1), r1=181(y1), r2=251(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 181
LDI r2, 251
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
