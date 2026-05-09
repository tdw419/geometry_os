; DESCRIPTION: Places a blue line segment connecting (328, 10) to (428, 244).
; PLAN: r0=328(x1), r1=10(y1), r2=428(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 10
LDI r2, 428
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
