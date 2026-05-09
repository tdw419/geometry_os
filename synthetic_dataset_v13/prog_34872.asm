; DESCRIPTION: Places a blue line segment connecting (431, 186) to (282, 248).
; PLAN: r0=431(x1), r1=186(y1), r2=282(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 186
LDI r2, 282
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
