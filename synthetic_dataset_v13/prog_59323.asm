; DESCRIPTION: Places a purple line segment connecting (180, 74) to (3, 31).
; PLAN: r0=180(x1), r1=74(y1), r2=3(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 74
LDI r2, 3
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
