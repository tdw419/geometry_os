; DESCRIPTION: Places a magenta line segment connecting (414, 155) to (371, 83).
; PLAN: r0=414(x1), r1=155(y1), r2=371(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 155
LDI r2, 371
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
