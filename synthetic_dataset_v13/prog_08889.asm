; DESCRIPTION: Places a magenta line segment connecting (83, 231) to (5, 232).
; PLAN: r0=83(x1), r1=231(y1), r2=5(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 231
LDI r2, 5
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
