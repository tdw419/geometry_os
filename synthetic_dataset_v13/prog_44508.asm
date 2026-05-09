; DESCRIPTION: Places a purple line segment connecting (38, 138) to (359, 79).
; PLAN: r0=38(x1), r1=138(y1), r2=359(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 138
LDI r2, 359
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
