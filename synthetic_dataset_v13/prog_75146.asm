; DESCRIPTION: Places a purple line segment connecting (315, 126) to (128, 54).
; PLAN: r0=315(x1), r1=126(y1), r2=128(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 126
LDI r2, 128
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
