; DESCRIPTION: Places a blue line segment connecting (371, 88) to (382, 149).
; PLAN: r0=371(x1), r1=88(y1), r2=382(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 88
LDI r2, 382
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
