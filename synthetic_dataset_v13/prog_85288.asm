; DESCRIPTION: Places a red line segment connecting (371, 88) to (331, 133).
; PLAN: r0=371(x1), r1=88(y1), r2=331(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 88
LDI r2, 331
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
