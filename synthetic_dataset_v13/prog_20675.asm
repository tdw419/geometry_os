; DESCRIPTION: Places a purple line segment connecting (231, 200) to (168, 136).
; PLAN: r0=231(x1), r1=200(y1), r2=168(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 200
LDI r2, 168
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
