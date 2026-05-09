; DESCRIPTION: Places a blue line segment connecting (62, 73) to (49, 52).
; PLAN: r0=62(x1), r1=73(y1), r2=49(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 73
LDI r2, 49
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
