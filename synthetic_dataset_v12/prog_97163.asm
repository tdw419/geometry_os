; DESCRIPTION: Places a blue line segment connecting (424, 8) to (85, 248).
; PLAN: r0=424(x1), r1=8(y1), r2=85(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 8
LDI r2, 85
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
