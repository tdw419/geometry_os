; DESCRIPTION: Places a blue line segment connecting (108, 90) to (280, 157).
; PLAN: r0=108(x1), r1=90(y1), r2=280(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 90
LDI r2, 280
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
