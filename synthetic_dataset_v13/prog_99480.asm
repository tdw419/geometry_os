; DESCRIPTION: Places a blue line segment connecting (113, 49) to (163, 14).
; PLAN: r0=113(x1), r1=49(y1), r2=163(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 49
LDI r2, 163
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
