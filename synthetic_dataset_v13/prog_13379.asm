; DESCRIPTION: Places a magenta line segment connecting (203, 218) to (323, 4).
; PLAN: r0=203(x1), r1=218(y1), r2=323(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 218
LDI r2, 323
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
