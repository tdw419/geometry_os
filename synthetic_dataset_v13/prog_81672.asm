; DESCRIPTION: Places a purple line segment connecting (359, 126) to (434, 34).
; PLAN: r0=359(x1), r1=126(y1), r2=434(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 126
LDI r2, 434
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
