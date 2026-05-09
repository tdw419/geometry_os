; DESCRIPTION: Places a black line segment connecting (390, 136) to (307, 47).
; PLAN: r0=390(x1), r1=136(y1), r2=307(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 136
LDI r2, 307
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
