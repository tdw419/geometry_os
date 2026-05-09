; DESCRIPTION: Places a purple line segment connecting (208, 56) to (490, 42).
; PLAN: r0=208(x1), r1=56(y1), r2=490(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 56
LDI r2, 490
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
