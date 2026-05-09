; DESCRIPTION: Places a magenta line segment connecting (474, 147) to (109, 80).
; PLAN: r0=474(x1), r1=147(y1), r2=109(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 147
LDI r2, 109
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
