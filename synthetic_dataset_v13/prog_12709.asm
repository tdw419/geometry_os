; DESCRIPTION: Places a purple line segment connecting (167, 24) to (349, 79).
; PLAN: r0=167(x1), r1=24(y1), r2=349(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 24
LDI r2, 349
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
