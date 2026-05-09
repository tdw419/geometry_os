; DESCRIPTION: Places a magenta line segment connecting (351, 87) to (490, 145).
; PLAN: r0=351(x1), r1=87(y1), r2=490(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 87
LDI r2, 490
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
