; DESCRIPTION: Places a magenta line segment connecting (13, 231) to (402, 180).
; PLAN: r0=13(x1), r1=231(y1), r2=402(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 231
LDI r2, 402
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
