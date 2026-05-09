; DESCRIPTION: Places a blue line segment connecting (84, 188) to (323, 223).
; PLAN: r0=84(x1), r1=188(y1), r2=323(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 188
LDI r2, 323
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
