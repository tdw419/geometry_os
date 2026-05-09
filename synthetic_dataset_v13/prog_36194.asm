; DESCRIPTION: Places a purple line segment connecting (398, 29) to (149, 108).
; PLAN: r0=398(x1), r1=29(y1), r2=149(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 29
LDI r2, 149
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
