; DESCRIPTION: Places a blue line segment connecting (505, 82) to (21, 119).
; PLAN: r0=505(x1), r1=82(y1), r2=21(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 82
LDI r2, 21
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
