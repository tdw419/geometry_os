; DESCRIPTION: Places a purple line segment connecting (424, 7) to (126, 180).
; PLAN: r0=424(x1), r1=7(y1), r2=126(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 7
LDI r2, 126
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
