; DESCRIPTION: Places a magenta line segment connecting (381, 158) to (282, 86).
; PLAN: r0=381(x1), r1=158(y1), r2=282(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 158
LDI r2, 282
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
