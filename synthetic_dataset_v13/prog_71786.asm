; DESCRIPTION: Places a purple line segment connecting (149, 210) to (334, 6).
; PLAN: r0=149(x1), r1=210(y1), r2=334(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 210
LDI r2, 334
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
