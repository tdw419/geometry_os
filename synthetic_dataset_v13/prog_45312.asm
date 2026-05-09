; DESCRIPTION: Places a purple line segment connecting (126, 63) to (20, 129).
; PLAN: r0=126(x1), r1=63(y1), r2=20(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 63
LDI r2, 20
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
