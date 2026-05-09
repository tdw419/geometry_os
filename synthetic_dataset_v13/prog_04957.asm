; DESCRIPTION: Places a blue line segment connecting (396, 213) to (172, 147).
; PLAN: r0=396(x1), r1=213(y1), r2=172(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 213
LDI r2, 172
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
