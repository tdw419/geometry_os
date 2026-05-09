; DESCRIPTION: Places a magenta line segment connecting (128, 84) to (155, 176).
; PLAN: r0=128(x1), r1=84(y1), r2=155(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 84
LDI r2, 155
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
