; DESCRIPTION: Places a magenta line segment connecting (128, 192) to (499, 145).
; PLAN: r0=128(x1), r1=192(y1), r2=499(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 192
LDI r2, 499
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
