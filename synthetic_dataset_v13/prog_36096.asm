; DESCRIPTION: Places a blue line segment connecting (188, 183) to (472, 128).
; PLAN: r0=188(x1), r1=183(y1), r2=472(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 183
LDI r2, 472
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
