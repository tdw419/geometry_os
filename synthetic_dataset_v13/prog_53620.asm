; DESCRIPTION: Places a blue line segment connecting (222, 248) to (204, 160).
; PLAN: r0=222(x1), r1=248(y1), r2=204(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 248
LDI r2, 204
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
