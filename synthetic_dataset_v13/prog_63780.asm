; DESCRIPTION: Places a purple line segment connecting (349, 220) to (413, 59).
; PLAN: r0=349(x1), r1=220(y1), r2=413(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 220
LDI r2, 413
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
