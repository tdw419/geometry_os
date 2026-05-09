; DESCRIPTION: Places a blue line segment connecting (364, 108) to (23, 180).
; PLAN: r0=364(x1), r1=108(y1), r2=23(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 108
LDI r2, 23
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
