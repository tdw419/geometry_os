; DESCRIPTION: Places a purple line segment connecting (38, 161) to (24, 96).
; PLAN: r0=38(x1), r1=161(y1), r2=24(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 161
LDI r2, 24
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
