; DESCRIPTION: Places a magenta line segment connecting (206, 252) to (109, 133).
; PLAN: r0=206(x1), r1=252(y1), r2=109(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 252
LDI r2, 109
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
