; DESCRIPTION: Places a purple line segment connecting (78, 167) to (39, 57).
; PLAN: r0=78(x1), r1=167(y1), r2=39(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 167
LDI r2, 39
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
