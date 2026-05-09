; DESCRIPTION: Places a purple line segment connecting (6, 94) to (1, 167).
; PLAN: r0=6(x1), r1=94(y1), r2=1(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 94
LDI r2, 1
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
