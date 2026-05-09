; DESCRIPTION: Places a magenta line segment connecting (351, 119) to (381, 113).
; PLAN: r0=351(x1), r1=119(y1), r2=381(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 119
LDI r2, 381
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
