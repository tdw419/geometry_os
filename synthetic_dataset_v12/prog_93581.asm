; DESCRIPTION: Places a purple line segment connecting (350, 156) to (126, 126).
; PLAN: r0=350(x1), r1=156(y1), r2=126(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 156
LDI r2, 126
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
