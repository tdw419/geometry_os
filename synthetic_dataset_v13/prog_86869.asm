; DESCRIPTION: Places a magenta line segment connecting (438, 160) to (376, 206).
; PLAN: r0=438(x1), r1=160(y1), r2=376(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 160
LDI r2, 376
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
