; DESCRIPTION: Places a blue line segment connecting (230, 34) to (459, 108).
; PLAN: r0=230(x1), r1=34(y1), r2=459(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 34
LDI r2, 459
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
