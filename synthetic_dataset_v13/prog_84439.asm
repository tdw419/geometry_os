; DESCRIPTION: Places a blue line segment connecting (181, 188) to (145, 224).
; PLAN: r0=181(x1), r1=188(y1), r2=145(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 188
LDI r2, 145
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
