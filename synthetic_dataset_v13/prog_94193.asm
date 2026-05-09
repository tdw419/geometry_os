; DESCRIPTION: Places a blue line segment connecting (416, 106) to (398, 87).
; PLAN: r0=416(x1), r1=106(y1), r2=398(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 106
LDI r2, 398
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
