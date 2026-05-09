; DESCRIPTION: Places a purple line segment connecting (349, 2) to (209, 60).
; PLAN: r0=349(x1), r1=2(y1), r2=209(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 2
LDI r2, 209
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
