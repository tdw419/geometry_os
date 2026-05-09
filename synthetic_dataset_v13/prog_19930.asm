; DESCRIPTION: Places a blue line segment connecting (149, 24) to (64, 150).
; PLAN: r0=149(x1), r1=24(y1), r2=64(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 24
LDI r2, 64
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
