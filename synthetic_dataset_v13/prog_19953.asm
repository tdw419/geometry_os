; DESCRIPTION: Places a blue line segment connecting (450, 36) to (149, 163).
; PLAN: r0=450(x1), r1=36(y1), r2=149(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 36
LDI r2, 149
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
