; DESCRIPTION: Places a blue line segment connecting (353, 200) to (371, 116).
; PLAN: r0=353(x1), r1=200(y1), r2=371(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 200
LDI r2, 371
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
